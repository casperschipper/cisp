import math
import operator as op
import re
import os
import random

# TODO
#
# Could a user define ListStreamCalls (stream calls that use arrays of stream as argument ?)

# streamcall needs to be aware of cs.fillf!

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
        for line in self.inFile:            
            if line != '\n':
                # if an expression is multiline, combine it
                fullLine += line 
            else:
                # if empty line, start parsing what has been harvested
                parser = Cisp(fullLine)
                result = parser.result()
                self.writeLine(result)
                print( result ) # print the parsed result
                fullLine = ''
        if (fullLine != ''):
            parser = Cisp(fullLine)
            result = parser.result()
            self.writeLine(result)
            print( result ) # print the parsed result
        self.outFile.write('\nday => now;') # this ends every file with time passing, just to avoid it closing.
        self.outFile.close()


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

def makeFunction( functionName, arguments, body ):
    "make a chuck Stream function, only stream arguments allowed"
    if arguments == None:
        arguments = [];
    arguments = ",".join(["Stream "+x for x in arguments]) # add Stream type before all values. Join with ',' .
    return "fun Stream "+ functionName + " ("+arguments+") {\n" + "return "+body+";\n}\n"

class StreamFuncDef(object):
    "A definition of a stream function, this will combine input streams into some output stream"
    def __init__(self,lexedCispDefinitionList,environment,depth):
        self.defList = lexedCispDefinitionList;
        self.env = environment
        self.depth = depth

        self.result = self.makeFunction(self.parse())

    def __repr__(self):
        return self.result

    def __str__(self):
        return self.__repr__()

    def makeFunction( functionName, arguments, body ):
        "make a chuck Stream function, only stream arguments allowed"
        if arguments == None:
            arguments = [];
        arguments = ",".join(["Stream "+x for x in arguments]) # add Stream type before all values. Join with ',' .
        return "fun Stream "+ functionName + " ("+arguments+") {\n" + "return "+body+";\n}\n"

    def parse(self):
        x = self.defList
        if len(x) > 3:
            (_, var, arg, body) = x # _ = 'fun'
        
            functionDiscr = { var : {'name':var , 'args':len(arg) }}

            env.update(thisFunction)

            localEnv = Env( None , None , env )

            for item in arg:
                localEnv.update({ item : { 'name' : name }}) # parameter stored in a local env, to not polute global env

            env[var]['args'] = len(arg) # store the number of args in env
            body = eval(body,localEnv)
        else: # no arguments, body is obligatory
            (_, var, body) = x
            functionDiscr = { var : {'name':var , 'args' : 0}}
            env.update(functionDicr)
            arg = None
            body = eval(body,env)
        return makeFunction(var,arg,body)

def makeNewBus ( busName, body ):
    " Make a Chuck Stream Bus, a bus is a shared stream. When a caller gets a new value it updates the state inside"
    return "st.bus("+body+",\""+busName+"\")"

def returnOldBus ( busName ):
    " Return a new value "
    return "st.bus("+busName+")"

class StreamCall(object):
    " this tranlates a function call "
    def __init__(self,name,arguments,environment,depth):
        self.cispname = name
        self.name = eval(name,environment,depth) # evaluate the name
        # this is mainly needed to move from seq() to st.seq.

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
        # this is the central construction of the function call:
        return self.name + "(" + self.printArguments() + ")" + self.setters()

    def evaluateArgs(self):
        # this avaluates the arguments
        self.arguments = [eval(exp, self.env, self.depth+1) for exp in self.arguments] 

    def checkArgs(self):
        # retrieve the number of args expected
        numOfArgs = (self.env.find(self.cispname)[self.cispname]).get('args')
        if not numOfArgs:
            numOfArgs = 'inf'
        
        if type(numOfArgs) == type(1):
            numOfArgs = [numOfArgs] 
            print('it is now this:'+ str(numOfArgs))
        if not  'inf' in numOfArgs and not len(self.arguments) in numOfArgs:
            raise Exception('function:'+ self.name + ' has '+str(len(self.arguments)) + ' args, expects: '+str(numOfArgs))

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
        while(item):
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

class ListStream(StreamCall):
    def printArguments(self):
        args = ','.join(self.arguments)
        return  '[' + mixedTypeListFix( args ) + ']'

class ListStreamCall(StreamCall):
    # this should be used for Seq, Series and Choice
    def printArguments(self):
        # checks if true, adds that to the end of the arguments, after the list
        if self.arguments[-1] == 'true':
            self.arguments = self.arguments[:-1]
            holdMode = ',true'
        else:
            holdMode = ''
        return '[' + ','.join(mixedTypeListFix(self.arguments)) + ']' + holdMode

class DirectSynth(StreamCall):
    "A function that calls a non-standard synth"
    # translator of names: 
    synthDict = {
        'step-gen' : 'StepSynth',
        'pulse-gen' : 'PulseSynth',
        'line-gen' : 'LineSynth',
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

def streamArray( seq ):
    # is used ?
    seq = [str(x) for x in seq]
    seq = mixedTypeListFix(seq)
    seq = ",".join(seq)
    string = '['+seq+']'
    string = string.replace('\n','')
    return string

class SuperChuckInst(StreamCall):
    def evaluateArgs(self):
        x = self.arguments
        self.arguments = [x[1]] + [eval(exp, self.env, self.depth+1) for exp in x[2:]] # evaluate everything but the name of the instrument

    def printArguments(self):
        self.arguments = ','.join(self.arguments)
        return SuperChuckInstStr(*self.arguments)

    def SuperChuckInstStr( instrumentName = 'saw', st_timer = 'st.st(1.0)', st_freq='st.st(440)', st_dur='st.st(1.0)' , st_amp='st.st(0.1)' ):
        "creates a little SuperChuck inst"
        funcName = unique.name('superChuckFunc')
        return """function void """+funcName+"""() { 
        SuperChuck sc;
        sc.instrument(\""""+instrumentName+"""\");
        sc.timer("""+st_timer+""");
        sc.freq("""+st_freq+""");
        sc.duration("""+st_dur+""");
        sc.amp("""+st_amp+""");
        sc.start();
        day => now;
    }
    spork ~ """+funcName+"""();
    """

class MakeTable(StreamCall):
    def evaluateArgs(self):
        # do not evaluate the name
        x = self.arguments
        self.tableName = x[0]
        self.generator = eval(x[1], self.env, self.depth+1)

    def __repr__(self):
        print('what are the arguments:'+ str(self.arguments))
        self.env[self.tableName] = {}
        self.env[self.tableName]['name'] = self.tableName
        return  self.generator + ' @=> ' + 'float ' + self.tableName + '[];'


def mixedTypeListFix(seq):
    " this deals with arrays that contain mixed type values, and makes them all streams if one or more streams are present "
    mask = [is_number(x) for x in seq]
    if True in mask and False in mask:
        return [makeStream(x) if mask[ind] else x for ind, x in enumerate(seq) ]
    return seq


def makeStream( arg ):
    "make a static value stream"
    return 'st.st('+arg+')'



def SuperChuckInst( instrumentName = 'saw', st_timer = 'st.st(1.0)', st_freq='st.st(440)', st_dur='st.st(1.0)' , st_amp='st.st(0.1)' ):
    funcName = unique.name('superChuckFunc')
    return """funct void """+funcName+"""() { 
    SuperChuck sc;
    sc.instrument(\""""+instrumentName+"""\");
    sc.timer("""+st_timer+""");
    sc.freq("""+st_freq+""");
    sc.duration("""+st_dur+""");
    sc.amp("""+st_amp+""");
    sc.start();
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
    "Here are most of the standard functions"
    env = Env()
    inf = 'inf'

    env.update({
        'true' : {'name':'true',    'args':0,           'class':Literal}, #this is a literal
        'seq': {'name':'st.seq',    'args':inf,         'class':ListStreamCall},
        'rv' : {'name': 'st.rv',    'args': 2 },
        'line' : {'name': 'st.line','args':2},
        'ch' : { 'name' : 'st.ch','args':inf,           'class':ListStreamCall},
        'series' : { 'name' : 'st.series','args':inf,   'class':ListStreamCall},
        'ser' : { 'name' : 'st.series','args':inf,   'class':ListStreamCall},


        'index' : { 'name' : 'st.index', 'args':2 },
        'walk' : { 'name' : 'st.walk','args':2 },
        'hold' : {'name' : 'st.hold', 'args':2},
        'line' : {'name' : 'st.line', 'args':2},
        'boundedWalk' : { 'name' : 'st.boundedWalk','args':3 },
        'bouncyWalk' : { 'name' : 'st.bouncyWalk', 'args':3 },
        'boundedListWalk' : { 'name' : 'st.boundedListWalk', 'args': 3 },
        'boundedMupWalk' : { 'name' : 'st.boundedMupWalk', 'args': 3 },
        't': {'name':'st.t','args': 2 },
        'count' : { 'name' : 'st.count','args': 1  },
        'list' : { 'name' : 'list', 'args': inf },
        'st' : { 'name' : 'st.st' , 'args' : 1 },
        '+' : { 'name' : 'st.sum', 'args' : inf },
        '-' : { 'name' : 'st.sub', 'args' : inf },
        '*' : { 'name' : 'st.mup', 'args' : inf },
        '/' : { 'name' : 'st.div', 'args' : inf },
        'step-gen' : { 'name' : 'step-gen', 'args' : 2,         'class':DirectSynth },
        'pulse-gen' : { 'name' : 'pulse-gen', 'args' : 2,       'class':DirectSynth },
        'line-gen' : { 'name' : 'line-gen', 'args' : 2,         'class':DirectSynth },

        'sci' : { 'name' : 'sci', 'args' : [2,3],               'class':SuperChuckInst },
        'bus' : { 'name' : 'st.bus', 'args': 2 },
        '~' : { 'name' : 'st.bus', 'args' : 2 },
        'collect' : {'name' : 'cs.collect', 'args' : 2,         'type':'floatArray' },

        'fill' : {'name':'cs.fill', 'args' : 3, 'type' : 'intArray' },
        'fillf' : {'name': 'cs.fillf', 'args' : 3, 'type':'floatArray' },
        '#' : {'name' : 'makeTable', 'args' : 2 ,               'class':MakeTable },
        'makeTable' : {'name' : 'makeTable', 'args' : 2,        'class':MakeTable }

    })
    return env

global_env = standard_env()

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False



# class Procedure(object):
#     "A user-defined Scheme procedure."
#     def __init__(self, parms, body, env):
#         self.parms, self.body, self.env = parms, body, env
#     def __call__(self, *args): 
#         return eval(self.body, Env(self.parms, args, self.env))


def eval(x, env=global_env, depth = 0):
    print("this is x" + str(x))
    #env = global_env
    "Evaluate an expression in an environment."
    if isinstance(x, Symbol):      # variable reference, not a function call
        symbol_object = env.find(x)[x] # return the name
        return symbol_object['name']
    elif isinstance(x, Number):
        return str(x)
    elif not isinstance(x, List):  # constant literal
        return x                
    elif x[0] == '\'':          # (quote exp)
        (_, exp) = x
        return exp
    elif is_number(x[0]) or isinstance(x[0],List): # if list with numbers or streams
        string = streamArray(x)
        return string
    elif x[0] == 'fun': # this should be moved into its own class.
        return str(StreamFuncDef(x,env,depth))
    elif x[0] in ['bus','~']: # this should be moved into its own class
        if len(x[1:]) > 1:
            return makeNewBus(x[1],eval(x[2])) + ';'
        else:
            len(x[1:]) == 1
            return returnOldBus(x[1]) + ';'
    else:
        proc = x[0]    
        args = x[1:]

        streamType = (env.find(x[0])[x[0]]).get('class')
        
        if streamType == None:
            # catch default
            streamType = StreamCall


        calledStream = str( streamType(proc, args, env ,depth + 1) ) 

        string = '\n'+('  '*depth) + calledStream
        
        return string



FileIO('test.lisp','output.ck')
#os.system("chuck --remove.all")
#os.system("chuck + output.ck") 


