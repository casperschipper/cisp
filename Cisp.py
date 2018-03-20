#!/usr/bin/python

import math
import operator as op
import re
import os
import random
import functools
import sys,getopt
from time import sleep
import uuid

# TODO

# bug: latch cannot do zero times an element ?
# adding streams to an already ongoing process.

# eval should remember if a list is generated from numbers (typed list), when a list is nested it should still know its origin

# a new st.write variant could be st.append: it adds a single value to a table. past values can simply be reached through the normal streams 
# with the table as parameter.
# (~ append tab1 (rv 0 100)) would add a random value between 0 100 to a table

# higher abstractions could be imagined, a 'smart' array that updates itself every now and then, has its own inner logic.
# a changing, evolving state. 

#  /usr/local/bin/chuck --srate:44100 --out:4 --chugin-path:/Users/casperschipper/Library/Application\ Support/ChucK/ChuGins --loop /Users/casperschipper/Google\ Drive/ChucK/tools/Tools.ck  


Symbol = str          # A Scheme Symbol is implemented as a Python str
List   = list         # A Scheme List is implemented as a Python list
Number = (int, float) # A Scheme Number is implemented as a Python int or float

# usage: FileIO( inputFile, outputFile) 
class FileIO(object):
    "File input output module"
    def __init__(self,fileInName,fileOutName):
        self.inFile = open(fileInName,'r')
        self.outFile = open(fileOutName,'w')
        
        unique_filename = 'tmp'

        self.cleanFile(unique_filename)
        self.processInfile()

        os.remove(unique_filename)
        print('the file',unique_filename,'was deleted.')


    def cleanFile(self,unique_filename):
        self.cleanFile = open(unique_filename,'w')
        data = ""
        for line in self.inFile:
            data += line

        self.cleanFile.write(self.remove_comments(data))
        self.cleanFile.close()        

        self.inFile = open(unique_filename,'r')
       

    def remove_comments(self,string):
        "remove comments & multi-line comments"
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
            
        self.outFile.write('\n<<<"shred id: ",me.id()>>>;');
        self.outFile.write('\nEvent end;\n(new ShredEventStack).push(end);\nend => now;') # add an end event
        self.outFile.close()

    def parseLine(self,string):
        parser = Cisp(string)
        result = parser.result()
        #print 'result:'
        #print (result)
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


# class EndEvent(object):
#     "This is used at the end of a shred, to be able to stop it. not in use currently"
#     def __init__(self,identifier):
#         self.identifier = identifier

#     def __repr__(self):
#         # we return the name, so we can stop it later
#         print "script is named: "+self.identifier;
#         return "Event theEnd @=> st.events["+self.identifier+"];\ntheEnd => now;\n"



class UniqueName(object):
    "creates unique names with a prefix, used for temp functions"
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
    "This is the main class, it takes a text file input and translates it to ChucK+Tools.ck family of objects"
    def __init__(self,text):
        #TODO REMOVE
        # lex the text, convert S-expressions to python lists
        self.parsedText = self.parse(text)
        # clean all the string stuff, combine paths with space inside
        self.parsedText = StringParser(self.parsedText).parse()
        #print "self.parsedText",self.parsedText
        
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

#Env = dict          # An environment is a mapping of {variable: value}

class StringParser:
    def __init__(self,seq):
        self.lst = seq

    def nextToken(self):
        if (self.lst):
            return self.lst.pop(0)
        return False

    def parse(self):
        "This ugly beast takes care of file strings and comments"
        result = [] 
        
        item = self.nextToken()
        while (item is not False): # first item passed
            if type(item) == type([]): # if it is a list, parse it first than add to list
                parser = StringParser(item)
                result = result + [parser.parse()]
            elif type(item) == type(""): # if the item is a string
                if item[0] == '\"':
                    combined = item # start a combined 
                    item = self.nextToken() # move on to next
                    while (item is not False): # if there is one
                        if type(item) == type(""):
                            combined = combined + ' ' + item
                            if item[-1] == '\"': # we reached the end
                                result = result + [combined] # store the combined result
                                break
                        else:
                            print( "ERROR unexpected string break" )
                        item = self.nextToken() # get next token
                else: # it is just a string not a special one
                    result = result + [item]
            else: # it is not a string, but a number
                result = result + [item]
            item = self.nextToken() # get the next token 
        return result



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
        
            functionDiscr = { var : {'name':var , 'args':len(arg) }}

            env.update(functionDiscr)

            localEnv = Env( () , () , env )

            for item in arg:
                localEnv.update({ item : { 'name' : item }}) # parameter stored in a local env, to not polute global env

            env[var]['args'] = len(arg) # store the number of args in env
            body = eval(body,localEnv)
        else: # no arguments, only name and body
            (_, var, body) = x
            functionDiscr = { var : {'name':var, 'args' : 0, 'isFunction': True }}
            env.update(functionDiscr)
            arg = None
            body = eval(body,env)
        return self.makeFunction(var,arg,body)

# A couple of helper functions
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
        # this is needed to move from (seq... ) to st.seq(.. ).

        self.arguments = arguments # including the keyed args

        self.env = environment # 
        self.depth = depth # depth is used for pretty formatting

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
            #print('it is now this:'+ str(numOfArgs))
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
                # add the arg to the key, evaluate the value of the key.
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
        return self.name + "(" + self.printArguments() + ")" + self.setters() + ';\n\n'


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
        string = (string + ';\n\n') * self.numberOfClones
        return  string


# NOT USED 
class ListStream(StreamCall):
    def printArguments(self):
        "Explicit list definition"
        args = ','.join(self.arguments)
        return  '[' + mixedTypeListFix( args ) + ']'

class ListStreamCall(StreamCall):
    "this should be used for Seq, Series and Choice"
    def evaluateArgs(self):
        "this avaluates the arguments"
        self.depth = 0;
        self.arguments = [eval(exp, self.env, self.depth+1) for exp in self.arguments] 

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
        self.depth = 0;
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
        
class PanSynth(StreamCall):
    def __repr__(self):
        sparkName = unique.name('shred')

        amp, timer, panner = self.arguments

    
        chuckCode = """
fun void """+sparkName+"""() {
"""+self.name+""" s;

s.init("""+amp+'\n,'+timer+'\n,'+panner+"""\n);

day => now;
}
spork ~ """+sparkName+"""();
""" # creates a function sparkname and immediately execute 
        return chuckCode

class WriteSchedule(StreamCall):
    "A function that calls a non-standard synth"
    def __repr__(self):
        print "self.name WRITESCHEDULE = ",self.name
        # generate a name, construct a  shred, spork it.
        sparkName = unique.name('shred')

        amp, timer = self.arguments

        chuckCode = """
fun void """+sparkName+"""() {
"""+self.name+""" s;
// shred to write value to table (st.write), amp is ignored
s.init("""+amp+'\n,'+timer+"""\n\n);

day => now;
}
spork ~ """+sparkName+"""();
""" # immediately execute 
        return chuckCode

class EventGenerator(StreamCall):
    "An event generator"
    def deferedParsFormatted(self):
        #print ("self.defered dict",self.defered)
        return "".join(["s.addDefered(\"" + key + "\","+ value + ");\n" for key,value in self.defered.items() ] )


    def extraParsFormatted(self):
        "this formats the extra parameters"
        #print "self.extra dict",self.extra
        return "".join( [ "s.addPar(\"" + key + "\","+ value + ");\n" for key,value in self.extra.items() ] )

    def splitKeyed(self):
        #print "something is ok"
        "Specially adjusted for once per event stream. Strip the keyed arguments (:key values)  from the arguments list"
        def snext(iterator):
            # safe next, returns false instead of raising error
            return next(iterator,False)

        def isKey(string):
            # returns key if starts with ':'
            if isinstance(string,str):
                if string[0] == ':':
                    return string[1:]
            return False

        def isDefer(string):
            # returns key if defer ;
            if (isinstance(string,str)):
                if string[0] == ';':
                    return string[1:]
            return False

        self.extra = {}
        self.defered = {} # this contains all the defered streams, evaluated once per event

        normalArgs = []
        
        iterator = iter(self.arguments)
        item = snext(iterator)
        isKeyedArg = False

        while(item is not False): 
            key = isKey(item)
            defer = isDefer(item)
            
            if key:
                # move to next arg
                item = snext(iterator)
                # add the arg to the key, evaluate the value of the key.
                self.extra[key] = eval(item,self.env,self.depth)
                # move forward and loop on
                item = snext(iterator)
            elif defer:
                # move to next arg
                item = snext(iterator)
                # add the arg to the key, evaluate the value of the key.
                self.defered[defer] = eval(item,self.env,self.depth)
                # move forward and loop on
                item = snext(iterator)
            else:
                #normal args
                normalArgs.append(item)
                item = snext(iterator)

        self.arguments = normalArgs 

class DirectSynth(EventGenerator):
    "A function that calls a non-standard synth"
    # translator of names: 

    def __repr__(self):
        # generate a name, lookup synth name, construct a Synth shred, spork it.
        sparkName = unique.name('shred')
        print "self.arguments"
        amp, timer = self.arguments

        panUnit = pancontrol = ""

        if "pan" in self.extra.keys():  #   
            panUnit = "Pan4 p => dac;"
            pancontrol = "p.pan("+self.extra["pan"]+");"
        elif "chan" in self.extra.keys():
            panUnit = "dac.chan("+self.extra["chan"]+" $ int);\n"
        else:
            panUnit = panUnit + "dac;\n"


        chuckCode = """
fun void """+sparkName+"""() {
"""+self.name+""" s => Safe safe =>"""+ panUnit +self.deferedParsFormatted()+"""\n

s.init("""+amp+'\n,'+timer+"""\n\n);

"""+pancontrol+"""

day => now;
}
spork ~ """+sparkName+"""();
""" # creates a function sparkname and immediately execute 
        return chuckCode

    def checkArgs(self):
        if len(self.arguments) != 2:
            print("error, stepgen wrong number of args (should be 2): "+len(self.arguments))
            return False
        return True

class FBSynth(DirectSynth):
    "A function that calls a non-standard synth"
    # translator of names: 

    def __repr__(self):
        # generate a name, lookup synth name, construct a Synth shred, spork it.
        sparkName = unique.name('shred')

        schedule = "";
        if (len(self.arguments) == 5):
            amp, timer, pan, freq, fb = self.arguments
        else:
            amp, timer, pan, freq, fb, schedule = self.arguments
            schedule = ","+schedule

        chuckCode = """
fun void """+sparkName+"""() {
"""+self.name+""" s => Safe safe => dac;

s.init("""+amp+','+timer+','+pan+','+freq+','+fb+schedule+"""\n\n);

day => now;
}
spork ~ """+sparkName+"""();
""" # creates a function sparkname and immediately execute 
        return chuckCode

    def checkArgs(self):
        if len(self.arguments) in [5,6]:
            print("error, wrong number of args (should be 5 or 6, amp time pan freq fb): ",len(self.arguments))
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
        if self.tableName in self.env.keys():
            return "cs.replacef("+self.generator+","+self.tableName+');\n\n'
        
        self.env[self.tableName] = {}
        self.env[self.tableName]['name'] = self.tableName
        return  self.generator + ' @=> ' + 'float ' + self.tableName + '[];\n\n'

class Wr(StreamCall):
    "This is generating values from a stream and storing them in a named float array, to be used later in other streams that use arrays"
    def evaluateArgs(self):
        # do not evaluate the name
        x = self.arguments
        self.valueName = x[0]
        self.value = eval(x[1], self.env, self.depth+1)

    def __repr__(self):
        return ' st.wr("'+self.valueName+'",'+self.value+') '

class Rd(StreamCall):
    "this reads values, therefore, does not try to evaluate name"
    def evaluateArgs(self):
        # do not evaluate the name
        self.valueName = self.arguments[0]

    def __repr__(self):
        return 'st.rd("'+self.valueName+'") '

class Define(StreamCall):
    "This declares the name in ST_store array, and sets initial value"
    def evaluateArgs(self):
        # do not evaluate the name
        x = self.arguments
        self.valueName = x[0]
        self.value = eval(x[1], self.env, self.depth+1)

    def __repr__(self):
        return ' st.define("'+self.valueName+'",'+self.value+');\n\n '


class MakeProcedure(StreamCall):
    "This creates a single-use class. It creates a Stream object as a funktor without input or output, it is only used for its side effects. For example the procedure can create tables or reset a certain bus."
    def evaluateArgs(self):
        x = self.arguments
        self.procedureName = x[0]
        self.procedureBody = eval(x[1], self.env,self.depth+1)

        # to safely use stream namespace, replace all 'st' with 'ST'
        self.procedureBody = self.procedureBody.replace('st.','ST.')

        #print "self.procedureBody", self.procedureBody
        self.env[self.procedureName] = {}
        self.env[self.procedureName]['name'] = self.procedureName
        #SOMETHING WITH PROCEDURES NEED TO BE STORED IN ENVIROMENT


    def __repr__(self):
        className = unique.name('Procedure')
        return """
        class """+className+""" extends Stream {
        st ST; // this is for namespace reasons, st is already used within Stream class.

        fun float next() {
        \t\t"""+self.procedureBody+""";
        \t}
        }\n\n
        """+className+' '+self.procedureName+';\n\n'

def mixedTypeListFix(seq):
    " this deals with arrays that contain mixed type values, and makes them all streams if one or more streams are present "
    def makeFloatyString(seq):
        # add a dot to the first float in seq, to force float array in ChucK !
        if '.' in seq[0]:
            return seq
        return [seq[0] + '.'] + seq[1:] 

    if len(seq) == 1: # do not try to cast a list/array
        return seq
    mask = [is_number(x) for x in seq]
    if True in mask and False in mask: # some streams, make all the values streams
        return [makeStream(x) if mask[ind] else x for ind, x in enumerate(seq) ]
    elif not all(mask): # if all are non-numbers: thus they are all streams.
        return [castClass(seq[0])] + seq[1:]
    return makeFloatyString(seq) # the list is numbers, make sure the first one is a float

def makeStream( arg ):
    "make a static value stream"
    return 'st.st('+arg+')'

def firstCharIsBracket( arg ):
    "remove noncharacters and check if the first thing is a bracket (could be weights)"
    return (arg.replace(' ','').replace('\n',''))[0] == '['

def castClass( arg ):
    "used in mixed type arrays, to force uniformity. In ChucK, the first element decides the array type. There are "
    if 'guard' or 'Guard' in arg:
        print("there is a guard")
        return arg + '$ Guard'
    if firstCharIsBracket(arg):
        return arg
    return arg+' $ Stream'

class SuperChuckInstStrClass(EventGenerator):
    # this is a new class to be used in situations were the parameters do not follow standard.

    def evaluateArgs(self):
        "this avaluates the arguments"
        instrumentName = self.arguments.pop(0) # do not eval instrumentName
        self.arguments = [instrumentName] + [eval(exp, self.env, self.depth+1) for exp in self.arguments] 

    def __repr__(self):
        funcName = unique.name('superChuckFunc')
        # the arguments are collected in a dict, use expansion on the list !!!!
        instrumentName = self.arguments[0]
        timer = self.arguments[1]


        extraParsString = self.extraParsFormatted()
        # here is the final string
        #print "extraParsString",extraParsString
        deferedParsString = self.deferedParsFormatted()
        #print ("these are the defered streams: ",deferedParsString)

        constructedString = """function void """+ funcName +"""() { 
        SuperChuck s;
        """+deferedParsString+"""
        s.instrument(\""""+instrumentName+"""\");\n"""+extraParsString+"\n"+"""
        s.timer("""+timer+""");
        s.play();
        day => now;
        } spork ~ """
        #print constructedString

        return constructedString+funcName+"();\n"

def SuperChuckInstStr( instrumentName = 'saw', st_timer = 'st.st(1.0)', st_freq='st.st(440)', st_dur='st.st(1.0)' , st_amp='st.st(0.1)', st_pan='st.st(0.0)', entryDelay = 0.0 ):
    funcName = unique.name('superChuckFunc')
    return """function void """+funcName+"""() { 
    SuperChuck sc;
    sc.instrument(\""""+instrumentName+"""\");
    sc.timer("""+st_timer+""");
    sc.freq("""+st_freq+""");
    sc.duration("""+st_dur+""");
    sc.amp("""+st_amp+""");
    sc.pan("""+st_pan+");" + str(entryDelay) + """ * second => now;
    sc.start();
    day => now;
}
spork ~ """+funcName+"""();
"""

class CustomOperator(StreamCall): 
    "This creates a CustomOperator subclass, it requires a name and a string that is evaluating to"
    def __str__(self):
        return self.__repr__()

    # def __repr__(self):
    #     "this is the central construction of the function call"
    #     return self.name + "(" + self.printArguments() + ")" + self.setters()

    # def evaluateArgs(self):
    #     "this avaluates the arguments"
    #     self.arguments = [eval(exp, self.env, self.depth+1) for exp in self.arguments]  



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

class SingleCall(object):
    # very simple function call, one line
    def __init__(self,string):
        self.value = string 

    def __repr__(self):
        return self.value + '();\n\n'
        
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
        'rf' : {'name' : 'st.rf' , 'args': 2},
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
        'ftom' : { 'name' : 'st.ftom' , 'args' : 1 },
        'sync' : { 'name' : 'cs.sync' , 'args' : 1 , 'class':SingleStatement }, 
        'clip' : { 'name' : 'st.clip' , 'args' : 3, },

        'index' : { 'name' : 'st.index', 'args':2 },
        'index-lin' : { 'name' : 'st.indexLin', 'args':2 },
        'walk' : { 'name' : 'st.walk','args':2 },
        'reset' : {'name' : 'st.reset', 'args' : 3 },
        'hold' : {'name' : 'st.hold', 'args':2 },
        'latch' : {'name' : 'st.latch', 'args':2 },
        'tlatch' : {'name' : 'st.tLatch', 'args':2},
        'tLatch' : {'name' : 'st.tLatch', 'args':2},
        'line' : {'name' : 'st.line', 'args':2},
        'mup-walk' : {'name' : 'st.mupWalk', 'args':2},
        'bounded-walk' : { 'name' : 'st.boundedWalk','args':3 },
        'bouncy-walk' : { 'name' : 'st.bouncyWalk', 'args':3 },
        'bounded-list-walk' : { 'name' : 'st.boundedListWalk', 'args': [1,2,3,4] },
        'bounded-mup-walk' : { 'name' : 'st.boundedMupWalk', 'args': 3 },
        'bouncy-list-walk' : { 'name' : 'st.bouncyListWalk', 'args' : 2},
        'list-walk' : {'name' : 'st.walkList', 'args':[1,2]},
        'list-walk-lin' : {'name':'st.listWalkLin', 'args': 2 },
        'write' : { 'name' : 'st.write', 'args' : [3,4] },
        'loop' : {'name' : 'st.loop', 'args': 3 },
        't': {'name':'st.t','args': 2 },
        'count' : { 'name' : 'st.count','args': 1  },
        'count2' : { 'name' : 'st.count2','args': [1,2] },
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
        '^' : { 'name' : 'st.pow' , 'args' : 2 },
        '>' : { 'name' : 'st.bigger','args' : [1,2]},
        '<' : { 'name' : 'st.smaller','args': [1,2]},
        'overwrite' : { 'name' : 'st.overwrite' ,'args' : 1},
        '=' : { 'name' : 'st.overwrite' , 'args' : 1},
        'pow' : { 'name' : 'st.pow' , 'args' : 2 },
        'sin' : { 'name' : 'st.sine' , 'args' : 1},
        'linlin' : { 'name' : 'st.linlin' , 'args' : 5 },
        'map' : {'name' : 'st.map' , 'args' : 5 },
        'scaleAC' : { 'name' : 'st.scaleAC', 'args' : 3 },
        'step-gen' : { 'name' : 'StepSynth', 'args' : 2,                'class':DirectSynth },
        'pulse-gen' : { 'name' : 'PulseSynth', 'args' : 2,              'class':DirectSynth },
        'line-gen' : { 'name' : 'LineSynth', 'args' : 2,                'class':DirectSynth },
        'pulse-fb-gen' : { 'name' : 'PulseFBSynth' , 'args' : [5,6] , 'class':FBSynth },
        'pulse-fb-gen2' : {'name' : 'PulseFBSynth2' , 'args' : [5,6], 'class' : FBSynth },
        'step-pan-gen' : { 'name' : 'StepPanSynth', 'args' : 3,         'class':PanSynth },
        'pulse-pan-gen' : { 'name' : 'PulsePanSynth', 'args' : 3,       'class':PanSynth },
        'line-pan-gen' : { 'name' : 'LinePanSynth', 'args' : 3,         'class':PanSynth },
        'pulse-fb-synth' : { 'name' : 'PulseFBSynth', 'args' : [5,6],       'class':FBSynth },
        'pulse-fb-synth2' : { 'name' : 'PulseFBSynth2', 'args' : [5,6],   'class':FBSynth },

        'sci' : { 'name' : 'sci', 'args' : [1,2,3,4,5,6],               'class':SuperChuckInst },
        'sci2' : { 'name' : 'sci', 'args' : range(1,64),              'class':SuperChuckInstStrClass },
        'midi-note' : {'name' : 'sci', 'args' : [3,4] ,                 'class':MidiNoteStream },
        'midi-ctrl' : {'name' : 'MidiControlStream', 'args': [3,4],     'class':MidiControlStream },
        'slider' : { 'name' : 'st.midiCtrl' , 'args': [1] },
        'bus' : { 'name' : 'st.bus', 'args': 2 },
        '~' : { 'name' : 'st.bus', 'args' : 2 },
        'collect' : {'name' : 'st.collect', 'args' : 2,          },

        'fill' : {'name':'cs.fill', 'args' : 3, 'type' : 'intArray',    'class':ArrayGen },
        'fillf' : {'name': 'cs.fillf', 'args' : 3, 'type':'floatArray', 'class':ArrayGen },
        'sine' : {'name' : 'cs.sine', 'args' : 2, 'type' : 'floatArray', 'class':ArrayGen },
        'phasor' : {'name' : 'st.phasor', 'args' : 1 },
        '#' : {'name' : 'makeTable', 'args' : 2 ,                       'class':MakeTable },
        'makeTable' : {'name' : 'makeTable', 'args' : 2,                'class':MakeTable },
        'read' : { 'name' : 'cs.buffToArray' , 'args' : 1 },
        'procedure' : {'name' : 'Procedure', 'args' : 2,                'class' : MakeProcedure },
        'schedule' : { 'name' : 'st.schedule' , 'args' : 2,             'class' : SingleStatement },
        'print' : {'name' : 'cs.printf', 'args':1,                      'class' : SingleStatement },
        'clone' : {'name' : 'cloner' , 'args' : [1,2],                     'class':Cloner},
        'fractRandTimer' : { 'name' : 'st.fractRandTimer', 'args': inf},
        'grow' : {'name':'cs.grow' , 'args' : 3 },
        'num' : {'name' : 'cs.number' , 'args' : 1 },
        'number' : {'name' : 'cs.number', 'args' : 1},
        'flt' : { 'name' : 'cs.float' , 'args' : 1},
        'rvi' : {'name':'cs.rv', 'args' : 2 },
        'rvfi' : {'name' : 'cs.rvf', 'args' : 2},
        'chi' : {'name' : 'cs.choose' , 'args' : inf },
        'chfi' : {'name' : 'cs.choosef' , 'args' : inf },
        'replacef' : {'name' : 'cs.replacef', 'args':2},
        'replace' : { 'name' : 'cs.replace' , 'args':2},
        'wr' : { 'name' : 'st.wr' , 'args' : 2, 'class' : Wr },
        'rd' : { 'name' : 'st.rd' , 'args' : 1, 'class' : Rd },
        'take' : {'name': 'st.take', 'args' : 1 },
        'diff' : {'name' : 'st.diff' , 'args' : 1 },
        'normalize' : { 'normstream' : 'st.normStream' , 'args' : inf },
        'OSC.table1' : { 'name' : 'OSC.table1' , 'args' : 0, 'class' : Literal },
        'OSC.table2' : { 'name' : 'OSC.table2' , 'args' : 0, 'class' : Literal },
        'OSC.table3' : { 'name' : 'OSC.table3' , 'args' : 0, 'class' : Literal },
        'OSC.table4' : {  'name' : 'OSC.table4' , 'args' : 0, 'class' : Literal },
        'OSC.table5' : { 'name' : 'OSC.table5' , 'args' : 0, 'class' : Literal },
        'OSC.table6' : { 'name' : 'OSC.table6' , 'args' : 0, 'class' : Literal },
        'OSC.table7' : {  'name' : 'OSC.table7' , 'args' : 0, 'class' : Literal },
        'OSC.table8' : { 'name' : 'OSC.table8' , 'args' : 0, 'class' : Literal },
        'OSC.table9' : { 'name' : 'OSC.table9' , 'args' : 0, 'class' : Literal },
        'read-write' : { 'name' : 'st.readWrite' , 'args': [3,4,5] },
        'write-schedule' : { 'name' : 'WriteSchedule' , 'args' : 2, 'class' : WriteSchedule },
        'onepole' : { 'name' : 'st.onepole', 'args': 2 },
        'waveoscl' : { 'name' : 'st.waveOscL','args':2 },
        'waveOscL' : { 'name' : 'st.waveOscL', 'args' : 2 },
        'waveosc' : { 'name' : 'st.waveOsc' , 'args' : 2 },
        'table-cap' : { 'name' : 'st.tableCap' , 'args' : 1 },
        'table-size' : { 'name' : 'st.tableCap' , 'args' : 1 },
        'hzPhasor' : { 'name' : 'st.hzPhasor', 'args' : 1},
        'sineseg' : { 'name' : 'st.sineseg' , 'args' : 1},
        'couple' : { 'name' : 'st.couple' , 'args' : 2 },
        'solo' : {'name' : 'ShredEventStack.popAll', 'args' : 0, 'class' : SingleCall, 'isFunction' : True},
        'guard' : { 'name' : 'st.guard', 'args' : 1 },
        'guardTest' : { 'name' : 'st.guardTest' , 'args' : 2 },
        '|' : { 'name' : 'st.guardTest', 'args' : 2 },
        '|=' : { 'name' : 'st.guardTestValue', 'args' : 2 },
        'guardControl' : { 'name' : 'st.guardControl', 'args' : 2 },
        'guardedWalk' : { 'name' : 'st.guardedWalk' , 'args' : 2 },
        'apply' : { 'name': 'st.apply' , 'args' : 2 },
        'define' : { 'name' : 'st.define', 'args' : 2, 'class' : Define }
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
    #print 'this is tested', item
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
    #env = global_env
    "Evaluate an expression in an environment."
    if isinstance(x, Symbol):      # variable reference, not a function call
        if x[0] == '\"' and x[-1] == '\"': # it may be a path
            return x # return the path, don't try to eval
        symbol_object = env.find(x)[x] # return the name
        if ('isFunction' in symbol_object.keys()):
            call = '()' 
        else:
            call = ''
        return symbol_object['name'] + call # call functions immediately, saving some parenthesis.
    elif isinstance(x, Number): # if first is number, the list is probably a list of things.
        if x % 1.0 == 0:
            return str(x)
        return '{:.12f}'.format(x) # enforce non-scientific notation for floats (chuck does not understand 0.23e-4)
    elif not isinstance(x, List):  # constant literal
        return x                
    elif x[0] == '\'':          # (quote exp)
        (_, exp) = x
        return exp
    elif is_number(x[0]) or isinstance(x[0],List): # if list with numbers or streams
        string = streamArray(x,env,0)
        return string
    elif x[0] == 'list':
        # this is an emergency solution, Ignores the 'list' word, treats as stream array.
        return streamArray(x[1:],env,depth)
    elif x[0] == 'fun': # this should be moved into its own class.
        return str(StreamFuncDef(x,env,0))
    elif x[0] in ['bus','~']: # this should be moved into its own class
        if len(x[1:]) > 1:
            # if there is a second argument, this is a new bus def
            return ('  '*depth)+makeNewBus(x[1],eval(x[2])) + ';\n\n'
        else:
            # return the old bus
            len(x[1:]) == 1
            return ('  '*depth)+returnOldBus(x[1])
    else:
        if len(x) is 1:
            # function without any args, get name
            literalName = (env.find(x[0])[x[0]]).get('name')
            # call it as a singleCall:
            return str(SingleCall(literalName));


        #print "streamcall detected:",x
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

class RunShred:
    "this is a class that contains different styles of running chuck shreds"
    def __init__(self,outputfile):
        self.outputfile = outputfile
        self.run()

    def run(self):
        os.system("killall chuck") # want to be sure
        os.system("/usr/local/bin/chuck --srate:44100 --out:4 --chugin-path:/Users/casperschipper/Library/Application\ Support/ChucK/ChuGins --loop /Users/casperschipper/Google\ Drive/ChucK/tools/Tools.ck &")  
        sleep(0.5)
        os.system("/usr/local/bin/chuck + " + self.outputfile + "&") 

class AddShred(RunShred):
    def run(self):
        print "+"
        os.system("/usr/local/bin/chuck + " + self.outputfile + "&") 

class GenerateCode(RunShred):
    "only generate the code"
    def run(self):
        print "generated " + self.outputfile

class ReplaceShred(RunShred):
    "replace the last shred"
    def run(self):
        os.system("/usr/local/bin/chuck + pop.ck")
        os.system("/usr/local/bin/chuck + " + self.outputfile + "&") 
        #print "code replace " + self.outputfile

class Stop(RunShred):
    "replace the last shred"
    def run(self):
        os.system("/usr/local/bin/chuck + removeAll.ck")
        #print "code replace " + self.outputfile

class Panic(RunShred):
    "removall add new"
    def run(self):
        os.system("/usr/local/bin/chuck --kill");

class All(RunShred):
    def run(self):
        os.system("/usr/local/bin/chuck + removeAll.ck")
        os.system("/usr/local/bin/chuck + " + self.outputfile + "&") 


# class ShredRegister(object):
#     def __init__(self):
#         # open the file without erasing
#         self.file = open('ShredRegister.txt','a')

#     def addShred(self,id):
#         self.file.write(id + ' ')

#     def wipe(self):
#         self.file  = open('ShredRegister.txt','w')

#     def removeShred(self,id)


def main(argv):
   inputfile = ''
   outputfile = ''
   command = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:c",["ifile=","ofile=","command="])
   except getopt.GetoptError as err:
      print str(err)
      print 'cisp.py -i <inputfile> -o <outputfile> -c <run:+:gen>'
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print 'cisp.py -i <inputfile> -o <outputfile> -c <run:+:gen>'
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputfile = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
      elif opt in ("-c", "--command"):
         command = arg

   if outputfile is '':
      print "outputfile not given, using default"
      outputfile = 'output.ck'
   if inputfile is '':
      print "missing inputfile, using the default"
      inputfile = 'test.lisp'
   if command is '':
      print "no command, using overwrite"
      command = 'replace'

   #print 'Input file is "', inputfile
   #print 'Output file is "', outputfile 
   
   # this is the important call, that actually creates the chuck files
   FileIO(inputfile,outputfile)

   print command,":COMMAND"

   runshreds = {
      "run" : RunShred,
      "+" : AddShred,
      "gen" : GenerateCode,
      "replace" : ReplaceShred,
      "stop" : Stop,
      "panic" : Panic,
      "all" : All
   }

   command = runshreds[command]

   command(outputfile)

if __name__ == "__main__":
   main(sys.argv[1:])




