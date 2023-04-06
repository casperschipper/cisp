import math
import operator as op
import re
import os
import random
import functools

# TODO
# How to do panning ?
# how to add multiple pars to sc
# how to do more feedback delays

# eval should remember if a list is generated from numbers (typed list), when a list is nested it should still know its origin

Symbol = str          # A Scheme Symbol is implemented as a Python str
List   = list         # A Scheme List is implemented as a Python list
Number = (int, float) # A Scheme Number is implemented as a Python int or float

# usage: FileIO( inputFile, outputFile) 
class FileIO(object):
    "File input output module"
    def __init__(self,fileInName,fileOutName):
        self.inFile = open(fileInName,'r')
        self.outFile = open(fileOutName,'w')
        self.processInfile()

    def writeLine(self,line):
        self.outFile.write(line)

    def processInfile(self):
        "Stack all the lines together, process each line"
        fullLine = '' 
        nOpen, nClosed, thisLineCount = 0, 0, 0

        # making sure we parse a full S-expression
        for line in self.inFile:
            nOpen += self.countOpen(line)
            nClosed += self.countClosed(line)
            thisLineCount = (nOpen - nClosed)
            if nOpen > 0:
                if thisLineCount != 0:
                    fullLine += line.replace('\n','')
                else:
                    fullLine += line.replace('\n','')
                    self.parseLine(fullLine)
                    fullLine = ''
                    nOpen, nClosed, thisLineCount = 0, 0, 0
            
        self.outFile.write('\nday => now;') # this ends every file with time passing, just to avoid it closing.
        self.outFile.close()

    def parseLine(self,string):
        parser = Cisp(string)
        result = parser.result()
        print 'result:'
        print (result)
        self.writeLine(result)

    def countOpen(self,string):
        count = 0
        for x in string:
            if x == '(':
                count += 1
        return count

    def countClosed(self,string):
        count = 0
        for x in string:
            if x == ')':
                count += 1
        return count

    def isComplete(self,string):
        "returns true if the line is balanced"
        level = 0
        flag = 0
        for x in string: 
            if x == '(':
                flag = True # there is at least one parenthesis
                level = level + 1
            elif x == ')':
                level = level - 1
        return (level == 0) and flag 

    def isIncomplete(self,string):
        level = 0




class UniqueName(object):
    "creates unique names with a prefix"
    def __init__(self):
        self.prefixDict = {}

    def name(self,prefix):
        "returns a unique name based on a prefix, if used before adds _2 _3 etc.."
        if prefix in self.prefixDict.keys():
            self.prefixDict[prefix] += 1
            return prefix+"_" + str(self.prefixDict[prefix])
        else:
            self.prefixDict[prefix] = 1
            return prefix+"_1"

unique = UniqueName()



class Cisp(object):
    "This is the main class, it takes a text file input and translates it to ChucK+Tools.ck"
    def __init__(self,text):
        cleanedText = self.remove_comments(text)
        # lex the text, convert S-expressions to python lists
        self.parsedText = self.parse(cleanedText)
        # evaluate the python lists to chuck code
        self.evaluatedText = eval(self.parsedText)

    def result(self):
        return self.evaluatedText

    def tokenize(self,chars):
        "Convert a string of characters into a list of tokens."
        return chars.replace('(', ' ( ').replace(')', ' ) ').split()

    def parse(self,program):
        "Read a Cisp expression from a string."
        return self.read_from_tokens(self.tokenize(program))

    def read_from_tokens(self,tokens):
        "Read an expression from a sequence of tokens."
        if len(tokens) == 0:
            raise SyntaxError('unexpected EOF while reading')
        token = tokens.pop(0)
        if '(' == token:
            L = []
            while tokens[0] != ')':
                L.append(self.read_from_tokens(tokens))
            tokens.pop(0) # pop off ')'
            return L
        elif ')' == token:
            raise SyntaxError('unexpected )')
        else:
            return self.atom(token)

    def atom(self,token):
        "Numbers become numbers; every other token is a symbol."
        try: return int(token)
        except ValueError:
            try: return float(token)
            except ValueError:
                return self.Symbol(token)

    def Symbol(self,token):
        "does something with a token"
        return token

    def remove_comments(self,string):
        pattern = r"(\".*?\"|\'.*?\')|(/\*.*?\*/|//[^\r\n]*$)"
        # first group captures quoted strings (double or single)
        # second group captures comments (//single-line or /* multi-line */)
        regex = re.compile(pattern, re.MULTILINE|re.DOTALL)
        def _replacer(match):
            # if the 2nd group (capturing comments) is not None,
            # it means we have captured a non-quoted (real) comment string.
            if match.group(2) is not None:
                return "" # so we will return empty to remove the comment
            else: # otherwise, we will return the 1st group
                return match.group(1) # captured quoted-string
        return regex.sub(_replacer, string)

Env = dict          # An environment is a mapping of {variable: value}

class Env(dict):
    "An environment: a dict of {'var':val} pairs, with an outer Env."
    def __init__(self, parms=(), args=(), outer=None):
        self.update(zip(parms, args))
        self.outer = outer
    def find(self, var):
        "Find the innermost Env where var appears. otherwise show what went wrong"
        try:
            return self if (var in self) else self.outer.find(var)
        except AttributeError:
            print('value:' + var + ' not found.')

class StreamFuncDef(object):
    "A definition of a stream function, this will combine input streams into some output stream"
    def __init__(self,lexedCispDefinitionList,environment,depth):
        self.defList = lexedCispDefinitionList;
        self.env = environment
        self.depth = depth
        parsed = self.parse()
        
        self.result = parsed

    def __repr__(self):
        return self.result

    def __str__(self):
        return self.__repr__()

    def makeFunction( self, functionName, arguments, body ):
        "make a chuck Stream function, only stream arguments allowed"
        if arguments == None:
            arguments = [];
        arguments = ",".join(["Stream "+x for x in arguments]) # add Stream type before all values. Join with ',' .
        return "fun Stream "+ functionName + " ("+arguments+") {\n" + "return "+body+";\n}\n"

    def parse(self):
        x = self.defList
        env = self.env
        if len(x) > 3:
            (_, var, arg, body) = x # _ = 'fun'
        
            functionDiscr = { var : {'name':var + '()' , 'args':len(arg) }}

            env.update(thisFunction)

            localEnv = Env( None , None , env )

            for item in arg:
                localEnv.update({ item : { 'name' : name }}) # parameter stored in a local env, to not polute global env

            env[var]['args'] = len(arg) # store the number of args in env
            body = eval(body,localEnv)
        else: # no arguments, only name and body
            (_, var, body) = x
            functionDiscr = { var : {'name':var + '()', 'args' : 0}}
            env.update(functionDiscr)
            arg = None
            body = eval(body,env)
        return self.makeFunction(var,arg,body)

def makeNewBus ( busName, body ):
    " Make a Chuck Stream Bus, a bus is a shared stream. When a caller gets a new value it updates the state inside"
    return "\nst.bus("+body+",\""+busName+"\")"

def returnOldBus ( busName ):
    " Return a new value "
    return "\nst.bus(\""+busName+"\")"

def anyIn( seq1, seq2 ):
    "return true of any item in seq is in seq2"
    for item in seq1:
        if item in seq2:
            return True
    return False


class StreamCall(object):
    " this tranlates a function call "
    def __init__(self,name,arguments,environment,depth):
        self.cispname = name
        self.name = eval(name,environment,depth) # evaluate the name
        # this is needed to move from seq() to st.seq.

        self.arguments = arguments # including the keyed args

        self.env = environment # a bit nasty to do it like this but okay
        self.depth = depth # depth is mainly used for pretty formatting

        self.splitKeyed() # split : notation named arguments. For example (seq 10 20 holdMode:true)
                          # will result in st.seq([10,20]).holdMode(true)


        self.checkArgs() # checks number and correctness of ars
        self.evaluateArgs() # evaluate arguments

    
    def __str__(self):
        return self.__repr__()

    def __repr__(self):
        "this is the central construction of the function call"
        return self.name + "(" + self.printArguments() + ")" + self.setters()

    def evaluateArgs(self):
        "this avaluates the arguments"
        self.arguments = [eval(exp, self.env, self.depth+1) for exp in self.arguments] 

    def checkArgs(self):
        "retrieve the number of args expected"
        numOfArgs = (self.env.find(self.cispname)[self.cispname]).get('args')
        if not numOfArgs:
            numOfArgs = 'inf'
        
        if type(numOfArgs) == type(1):
            numOfArgs = [numOfArgs] 
            print('it is now this:'+ str(numOfArgs))
        if not  'inf' in numOfArgs and not len(self.arguments) in numOfArgs:
            raise Exception('function:'+ self.name + ' has '+str(len(self.arguments)) + ' args, expects: '+str(numOfArgs) + '\n' + 'argumnets were:' + str(self.arguments) +'\n')

    def splitKeyed(self):
        "Strip the keyed arguments (:key values)  from the arguments list"
        def snext(iterator):
            # safe next, returns false instead of raising error
            return next(iterator,False)

        def isKey(string):
            # returns key if starts with ':'
            if isinstance(string,str):
                if string[0] == ':':
                    return string[1:]
            return False

        self.extra = {}
        normalArgs = []
        
        iterator = iter(self.arguments)
        item = snext(iterator)
        isKeyedArg = False

        while(item is not False): 
            key = isKey(item)
            if key:
                # move to next arg
                item = snext(iterator)
                # add the arg to the key
                self.extra[key] = eval(item,self.env,self.depth)
                # move forward and loop on
                item = snext(iterator)
            else:
                #normal args
                normalArgs.append(item)
                item = snext(iterator)

        self.arguments = normalArgs       

    def printArguments(self):
        # this joins the (evaluated) arguments, separated by a comma.
        return ",".join(self.arguments)

    def setters(self):
        # there must be some way of telling to the outside world that this should be treaded as list thing when embedded in an SEQ.
        return "".join(['.'+str(key)+'(' + str(value) + ')' for key,value in self.extra.items()])

class SingleStatement(StreamCall):
    def __repr__(self):
        return self.name + "(" + self.printArguments() + ")" + self.setters() + ';'


class Cloner(StreamCall):
    # this should clone a segment of code n times
    def __init__(self,name,arguments,environment,depth):
        self.cispname = name
        self.name = eval(name,environment,depth) # evaluate the name
        # this is needed to move from seq() to st.seq.

        self.numberOfClones = arguments.pop() # pop the number of times from the arguments
        print('self numberOfClones',self.numberOfClones,type(self.numberOfClones))
        self.arguments = arguments # including the keyed args

        self.env = environment # a bit nasty to do it like this but okay
        self.depth = depth # depth is mainly used for pretty formatting

        self.splitKeyed() # split : notation named arguments. For example (seq 10 20 holdMode:true)
                          # will result in st.seq([10,20]).holdMode(true)


        self.checkArgs() # checks number and correctness of ars
        self.evaluateArgs() # evaluate arguments

    def __str__(self):
        return self.__repr__()

    def __repr__(self):
        "this is the central construction of the function call"
        string = self.printArguments()
        string = (string + ';\n') * self.numberOfClones
        return  string


# NOT USED 
class ListStream(StreamCall):
    def printArguments(self):
        "Explicit list definition"
        args = ','.join(self.arguments)
        return  '[' + mixedTypeListFix( args ) + ']'

class ListStreamCall(StreamCall):
    "this should be used for Seq, Series and Choice"
    def printArguments(self):
        "checks if holdmode true, adds that to the end of the arguments, after the list"
        if self.arguments[-1] == 'true':
            self.arguments = self.arguments[:-1]
            holdMode = ',true'
        else:
            holdMode = ''
        if (self.checkIfArgsIsArrayPointer()):
            return ','.join(mixedTypeListFix(self.arguments)) + holdMode
        return '[' + ','.join(mixedTypeListFix(self.arguments)) + ']' + holdMode

    def checkIfArgsIsArrayPointer(self):
        "check arguments, only True with single argument"
        if len(self.arguments) == 1:
            return True
        return False


class ListListStreamCall(StreamCall):
    "this is used for weights"
    def evaluateArgs(self):
        self.arguments = [eval(exp, self.env, self.depth+1) for exp in self.arguments] 
        if matchStrings(self.arguments,'st'):
            self.name = eval('stream-weights')

class BusCall(StreamCall):
    "This should do something based on the number of arguments"
    def __str__(self):
        return self.__repr__()

    def __repr__(self):
        "this is the central construction of the function call"
        return self.name + "(" + self.printArguments() + ")" + self.setters()

    def evaluateArgs(self):
        "this avaluates the arguments"
        self.arguments = [eval(exp, self.env, self.depth+1) for exp in self.arguments]  

class ArrayGen(StreamCall):
    def printArguments(self):
        return ",".join(self.arguments)
        

class DirectSynth(StreamCall):
    "A function that calls a non-standard synth"
    # translator of names: 
    synthDict = {
        'step-gen' : 'StepSynth', # sah sythesis
        'pulse-gen' : 'PulseSynth', # pulse synthesis, zero in between values
        'line-gen' : 'LineSynth', # interpolates linearily between steps
    }

    def __repr__(self):
        # generate a name, lookup synth name, construct a Synth shred, spork it.
        sparkName = unique.name('shred')

        self.generatorName = DirectSynth.synthDict.get(self.name)

        if self.generatorName == None:
            raise(Exception("unkown generatorName" + self.generatorName))

        amp, timer = self.arguments

        chuckCode = """
fun void """+sparkName+"""() {
"""+self.generatorName+""" s => Safe safe => dac;

s.init("""+amp+'\n,'+timer+"""\n\n);

day => now;
}
spork ~ """+sparkName+"""();
""" # creates a function sparkname and immediately executse 
        return chuckCode
        

    def checkArgs(self):
        if len(self.arguments) != 2:
            print("error, stepgen wrong number of args (should be 2): "+len(self.arguments))
            return False
        return True

def streamArray( seq, env, depth ): 
    "streamArray"
    allNumbersFlag = isAllNumbersR(seq)
    seq = [eval(x,env,depth) for x in seq]
    
    # only fix if it is not all numbers !
    if not allNumbersFlag:
        seq = mixedTypeListFix(seq)

    seq = ",".join(seq)
    string = '['+seq+']'
    string = string.replace('\n','')
    return string

def isAllNumbersR(l):
    "verifies if all items in l are numbers (if nested lists, tries recursevely"
    if isinstance(l,List):
        return all(isAllNumbersR(i) for i in l)
    return is_number(l)

class SuperChuckInst(StreamCall):
    "This is  used to create SuperCollider OSC messages, using a synth and than some parameters"
    def __repr__(self):
        # this is the central construction of the function call:
        return self.printArguments() 

    def evaluateArgs(self):
        x = self.arguments
        self.arguments =  [str(x[0])] + [eval(exp, self.env, self.depth+1) for exp in x[1:]] # evaluate everything but the name of the instrument

    def printArguments(self):
        return SuperChuckInstStr(*self.arguments)

class MidiNoteStream(StreamCall):
    "This is a bridge to create a stream of midi notes: timer, pitch, velocity, duration"
    def __repr__(self):
        # this is the central construction of the function call:
        return self.printArguments() 

    def evaluateArgs(self):
        x = self.arguments
        self.arguments = [eval(exp, self.env, self.depth+1) for exp in x] # evaluate everything but the name of the instrument

    def printArguments(self):
        return MidiChuckInstrStr(*self.arguments)

class MidiControlStream(MidiNoteStream):
    "This is a bridge to create a stream of midi controller changes"
    def printArguments(self):
        return MidiCtrlStr(*self.arguments)

class MakeTable(StreamCall):
    "This is generating values from a stream and storing them in a named float array, to be used later in other streams that use arrays"
    def evaluateArgs(self):
        # do not evaluate the name
        x = self.arguments
        self.tableName = x[0]
        self.generator = eval(x[1], self.env, self.depth+1)

    def __repr__(self):
        self.env[self.tableName] = {}
        self.env[self.tableName]['name'] = self.tableName
        return  self.generator + ' @=> ' + 'float ' + self.tableName + '[];'


def mixedTypeListFix(seq):
    " this deals with arrays that contain mixed type values, and makes them all streams if one or more streams are present "
    if len(seq) == 1:
        return seq
    mask = [is_number(x) for x in seq]

    if True in mask and False in mask: # some streams, make all the values streams
        return [makeStream(x) if mask[ind] else x for ind, x in enumerate(seq) ]
    elif False in mask and not True in mask: # TODO explicit test there are only non float objects (probably streams...)
        return [castStream(seq[0])] + seq[1:]
    return seq


def makeStream( arg ):
    "make a static value stream"
    return 'st.st('+arg+')'

def castStream( arg ):
    "used in mixed type arrays, to force streams. In ChucK, the first element decides the array type."
    if '[' in arg:
        return arg
    return arg+' $ Stream'

def SuperChuckInstStr( instrumentName = 'saw', st_timer = 'st.st(1.0)', st_freq='st.st(440)', st_dur='st.st(1.0)' , st_amp='st.st(0.1)', st_pan='st.st(0.0)' ):
    funcName = unique.name('superChuckFunc')
    return """function void """+funcName+"""() { 
    SuperChuck sc;
    sc.instrument(\""""+instrumentName+"""\");
    sc.timer("""+st_timer+""");
    sc.freq("""+st_freq+""");
    sc.duration("""+st_dur+""");
    sc.amp("""+st_amp+""");
    sc.pan("""+st_pan+""");
    sc.start();
    day => now;
}
spork ~ """+funcName+"""();
"""

def MidiChuckInstrStr(st_timer = 'st.st(0.25)', st_pitch='st.st(59)', st_dur='st.st(0.25)' , st_velo='st.st(80)' ):
    "creates a little Midi instrument inst"
    funcName = unique.name('midi_instr')
    return """function void """+funcName+"""() { 
    MidiStream midi;
    midi.timer("""+st_timer+""");
    midi.pitch("""+st_pitch+""");
    midi.velo("""+st_velo+""");
    midi.dura("""+st_dur+""");
    midi.start();
    day => now;
}
spork ~ """+funcName+"""();
"""
def MidiCtrlStr(st_timer = 'st.st(1)',st_channel = '1', st_controller = 'st.st(1)', st_value='st.st(0)'):
    funcName = unique.name('midi_instr')
    return """function void """+funcName+"""() { 
    MidiControlStream midi;
    midi.channel("""+st_channel+""");
    midi.timer("""+st_timer+""");
    midi.controller("""+st_controller+""");
    midi.value("""+st_value+""");
    midi.start();
    day => now;
}
spork ~ """+funcName+"""();
"""


class Literal(object):
    # very simple object
    def __init__(self,string):
        self.value = string

    def __repr__(self):
        return self.value
        
    def __str__(self):
        return self.__repr__()

def standard_env():
    "Here are most of the standard functions in Cisp"
    env = Env()
    inf = 'inf'

    env.update({
        'true' : {'name':'true',    'args':0,           'class':Literal}, #this is a literal
        'seq': {'name':'st.seq',    'args':inf,         'class':ListStreamCall},
        'rv' : {'name': 'st.rv',    'args': 2 },
        'exprv' : {'name' : 'st.exprv', 'args' : 3},
        'line' : {'name': 'st.line','args':2},
        'ch' : { 'name' : 'st.ch','args':inf,           'class':ListStreamCall},
        'weights' : { 'name' : 'st.weights', 'args': inf, 'class':ListListStreamCall },
        'stream-weights' : { 'name' : 'st.weightStream', 'args' : 2 },
        'series' : { 'name' : 'st.series','args':inf,   'class':ListStreamCall},
        'ser' : { 'name' : 'st.series','args':inf,   'class':ListStreamCall},
        'floor' : { 'name' : 'st.floor' , 'args' : 1   },
        'test' : { 'name' : 'st.test' , 'args' : 1, 'class':SingleStatement },
        'mtof' : { 'name' : 'st.mtof' , 'args' : 1 },
        'sync' : { 'name' : 'cs.sync' , 'args' : 1 , 'class':SingleStatement }, 
        'clip' : { 'name' : 'st.clip' , 'args' : 3, },

        'index' : { 'name' : 'st.index', 'args':2 },
        'walk' : { 'name' : 'st.walk','args':2 },
        'hold' : {'name' : 'st.hold', 'args':2},
        'latch' : {'name' : 'st.latch', 'args':2},
        'tlatch' : {'name' : 'st.tLatch', 'args':2},
        'tLatch' : {'name' : 'st.tLatch', 'args':2},
        'line' : {'name' : 'st.line', 'args':2},
        'mup-walk' : {'name' : 'st.mupWalk', 'args':2},
        'bounded-walk' : { 'name' : 'st.boundedWalk','args':3 },
        'bouncy-walk' : { 'name' : 'st.bouncyWalk', 'args':3 },
        'bounded-list-walk' : { 'name' : 'st.boundedListWalk', 'args': [1,2,3,4] },
        'bounded-mup-walk' : { 'name' : 'st.boundedMupWalk', 'args': 3 },
        'loop' : {'name' : 'st.loop', 'args': 3 },
        't': {'name':'st.t','args': 2 },
        'count' : { 'name' : 'st.count','args': 1  },
        'list' : { 'name' : 'list', 'args': inf },
        'st' : { 'name' : 'st.st' , 'args' : 1 },
        '+' : { 'name' : 'st.sum', 'args' : inf },
        '-' : { 'name' : 'st.sub', 'args' : inf },
        '*' : { 'name' : 'st.mup', 'args' : inf },
        '/' : { 'name' : 'st.div', 'args' : inf },
        '<<' : { 'name' : 'st.bitShiftL', 'args' : 2 },
        '>>' : { 'name' : 'st.bitShiftR', 'args' : 2 },
        '&&' : { 'name' : 'st.bitAnd', 'args' :2 },
        '||' : { 'name' : 'st.bitOr', 'args' : 2 },
        'step-gen' : { 'name' : 'step-gen', 'args' : 2,         'class':DirectSynth },
        'pulse-gen' : { 'name' : 'pulse-gen', 'args' : 2,       'class':DirectSynth },
        'line-gen' : { 'name' : 'line-gen', 'args' : 2,         'class':DirectSynth },

        'sci' : { 'name' : 'sci', 'args' : [1,2,3,4,5,6],               'class':SuperChuckInst },
        'midi-note' : {'name' : 'sci', 'args' : [3,4] ,         'class': MidiNoteStream },
        'midi-ctrl' : {'name' : 'MidiControlStream', 'args': [3,4], 'class' : MidiControlStream },
        'bus' : { 'name' : 'st.bus', 'args': 2 },
        '~' : { 'name' : 'st.bus', 'args' : 2 },
        'collect' : {'name' : 'st.collect', 'args' : 2,          },

        'fill' : {'name':'cs.fill', 'args' : 3, 'type' : 'intArray', 'class':ArrayGen },
        'fillf' : {'name': 'cs.fillf', 'args' : 3, 'type':'floatArray', 'class':ArrayGen },
        'sine' : {'name' : 'cs.sine', 'args' : 2, 'type' : 'floatArray', 'class':ArrayGen },
        '#' : {'name' : 'makeTable', 'args' : 2 ,               'class':MakeTable },
        'makeTable' : {'name' : 'makeTable', 'args' : 2,        'class':MakeTable },
        'print' : {'name' : 'cs.printf', 'args':1 },
        'clone' : {'name' : 'cloner' , 'args' : [1,2],                     'class':Cloner},
        'fractRandTimer' : {'name' : 'st.fractRandTimer', 'args': 1}
    })
    return env
    
global_env = standard_env()

# *** helper functions

def is_number(s):
    "returns true if integer or float (from string!)"
    try:
        float(s)
        return True
    except ValueError:
        return False
    except TypeError:
        return False


def matchStrings(haystack,needle):
    "tries to find a needle in a haystack, recursevely"
    def testFunc(string):
        try:
            string.index(needle)
            return True
        except ValueError:
            return False
        return testFunc
    return recursiveTestAny(haystack,testFunc)

def recursiveTestAll(item,test):
    "recursevely traverse a tree, only if all tests are true, return True"
    if isinstance(item,List):
        return all( [recursiveTestAll(x,test) for x in item ] )
    return test(item)

def recursiveTestAny(item,test):
    "same as recursive test all, but returns true if any test returns true"
    print 'this is tested', item
    if isinstance(item,List):
        return any( [recursiveTestAny(x,test) for x in item ] )
    return test(item)

def makeStringFinder(arg):
    "a higher level function, not used for now"
    def g(string):
        return string.find(arg) != -1
    return g



# class Procedure(object):
#     "A user-defined Scheme procedure."
#     def __init__(self, parms, body, env):
#         self.parms, self.body, self.env = parms, body, env
#     def __call__(self, *args): 
#         return eval(self.body, Env(self.parms, args, self.env))


def eval(x, env=global_env, depth = 0,listlist = False):
    print("eval : " + str(x))
    #env = global_env
    "Evaluate an expression in an environment."
    if isinstance(x, Symbol):      # variable reference, not a function call
        symbol_object = env.find(x)[x] # return the name
        return symbol_object['name']
    elif isinstance(x, Number):
        return str(x) #TODO add formatting of float
    elif not isinstance(x, List):  # constant literal
        return x                
    elif x[0] == '\'':          # (quote exp)
        (_, exp) = x
        return exp
    elif is_number(x[0]) or isinstance(x[0],List): # if list with numbers or streams
        string = streamArray(x,env,depth)
        return string
    elif x[0] == 'list':
        # this is an emergency solution ! Ignores the 'list' word, treats as stream array.
        return streamArray(x[1:],env,depth)
    elif x[0] == 'fun': # this should be moved into its own class.
        return str(StreamFuncDef(x,env,depth))
    elif x[0] in ['bus','~']: # this should be moved into its own class
        if len(x[1:]) > 1:
            # if there is a second argument, this is a new bus def
            return makeNewBus(x[1],eval(x[2])) + ';'
        else:
            # return the old bus
            len(x[1:]) == 1
            return returnOldBus(x[1])
    else:
        proc = x[0]    
        args = x[1:]

        # find which class to use to parse this:
        streamType = (env.find(x[0])[x[0]]).get('class')
        
        if streamType == None:
            # catch default
            streamType = StreamCall


        calledStream = str( streamType(proc, args, env ,depth + 1) ) 

        string = '\n'+('  '*depth) + calledStream
        
        return string

def mainApp():
    FileIO('test.lisp','output.ck')
    os.system("chuck --remove.all")
    os.system("chuck + output.ck") 

mainApp()




