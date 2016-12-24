import math
import operator as op
import re
import os
import random

# TODO
#
# keyword arguments can be implemented as methods in a class.
# for example:
# seq([11,12,13,14,15,16]).max(line(seq(0,3),st(100))
# would translate to:
# (seq 11 12 13 14 15 16 :max (line (seq 0 3) (st 100)))

Symbol = str          # A Scheme Symbol is implemented as a Python str
List   = list         # A Scheme List is implemented as a Python list
Number = (int, float) # A Scheme Number is implemented as a Python int or float

userFunctions = []

class StreamCall:
    def __init__(self,'name'):
        self.name = 'name'
        self.arguments = 'none'
    
    def __string__(self):
        return ""

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
        "Find the innermost Env where var appears."
        return self if (var in self) else self.outer.find(var)

def seqMixedTypeFix(seq):
    " this deals with arrays that contain mixed type values, and makes them all streams if one or more streams are present "
    mask = [is_number(x) for x in seq]
    if True in mask and False in mask:
        return [makeStream(x) if mask[ind] else x for ind, x in enumerate(seq) ]
    return seq


def makeStream( arg ):
    "make a static value stream"
    return 'st.st('+arg+')'

def makeFunction( functionName, arguments, body ):
    "make a chuck Stream function, only stream arguments allowed"
    if arguments == None:
        arguments = [];
    arguments = ",".join(["Stream "+x for x in arguments]) # add Stream type before all values. Join with ',' .
    return "fun Stream "+ functionName + " ("+arguments+") {\n" + "return "+body+";\n}\n"

def makeNewBus ( busName, body ):
    " Make a Chuck Stream Bus, a bus is a shared stream. When a caller gets a new value it updates the state inside"
    return "st.bus("+body+",\""+busName+"\")"

def returnOldBus ( busName ):
    " Return a new value "
    return "st.bus("+busName+")"

def streamFunc(name,arguments):
    " This deals with various types of functions, making sure the arguments are typed right "

    if (name in ['st.seq','st.ch','st.series'] ):
        # check if the last argument is 'true', than use holdMode
        if arguments[-1] == 'true':
            arguments = arguments[:-1]
            holdMode = ',true'
        else:
            holdMode = ''
        
        arguments = seqMixedTypeFix(arguments)
        
        arguments = ",".join(arguments)
        formatString = '{funcname}([ {args} ]'+holdMode+')'
    elif(name == 'list'):
        arguments = seqMixedTypeFix(arguments)
        arguments = ",".join(arguments)
        formatString = '[ {args} ]'
    elif(name == 'stepgen'):
        if len(arguments) != 2:
            print('error, stepgen wrong number of args')
        amp, timer = arguments
        sparkName = unique.name('shred')
        return 
        """
function void"""+sparkName+"""() {
StepSynth s => Safe safe => dac;

s.init("""+amp+'\n,'+timer+"""\n\n);

day => now;
}
spork ~ """+sparkName+"""();
""" # creates a function sparkname and immediately executse 

    elif(name == 'sci'):
        print(arguments)
        return SuperChuckInst(*arguments) 
        
    else:
        arguments = ",".join(arguments)
        formatString = '{funcname}({args})'
    
    
    return formatString.format(args = arguments,funcname = name)

def SuperChuckInst( instrumentName = 'saw', st_timer = 'st.st(1.0)', st_freq='st.st(440)', st_dur='st.st(1.0)' , st_amp='st.st(0.1)' ):
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


def caspArray( seq ):
    # is used ?
    seq = [str(x) for x in seq]
    seq = seqMixedTypeFix(seq)
    seq = ",".join(seq)
    string = '['+seq+']'
    string.replace('\n','')
    return string

def standard_env():
    "An environment with some Scheme standard procedures."
    env = Env()
    inf = 'inf'

    env.update({
        'true' : {'name':'true','args':0}, #this is a literal
        'seq': {'name':'st.seq','args':inf},
        'rv' : {'name': 'st.rv','args': 2},
        'line' : {'name': 'st.line','args':2},
        'ch' : { 'name' : 'st.ch','args':inf},
        'index' : { 'name' : 'st.index', 'args':2},
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
        'step-gen' : { 'name' : 'stepgen', 'args' : 2 },
        'sci' : { 'name' : 'sci', 'args' : [2,3] },
        'bus' : { 'name' : 'st.bus', 'args': 2 },
        '~' : { 'name' : 'st.bus', 'args' : 2 },
        'collect' : {'name' : 'cs.collect', 'args' : 2}
    })
    return env

global_env = standard_env()

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

class Procedure(object):
    "A user-defined Scheme procedure."
    def __init__(self, parms, body, env):
        self.parms, self.body, self.env = parms, body, env
    def __call__(self, *args): 
        return eval(self.body, Env(self.parms, args, self.env))

def eval(x, env=global_env, depth = 0):
    #env = global_env
    "Evaluate an expression in an environment."
    print (x)
    if isinstance(x, Symbol):      # variable reference
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
        string = caspArray(x)
        return string
    elif x[0] == 'fun':
        if len(x) > 3:
            (_, var, arg, body) = x
            env[var] = {}
            env[var]['name'] = var 
            for item in arg:
                env[item] = {'name':item} # also store parms in env
            env[var]['args'] = len(arg) # store the number of args in env
        else: # no arguments
            (_, var, body) = x
            env[var] = {}
            env[var]['name'] = var+ '()'
            arg = None
        body = eval(body,env)
        return makeFunction(var,arg,body)
    elif x[0] == 'bus':
        if len(x[1:]) > 1:
            return makeNewBus(x[1],eval(x[2])) + ';'
        else:
            len(x[1:]) == 1
            return returnOldBus(x[1]) + ';'
    else:
        proc = eval(x[0], env, depth+1)
        # check the amount of args ?
        numOfArgs = (env.find(x[0])[x[0]])['args']
        if type(numOfArgs) == type(1):
            numOfArgs = [numOfArgs] 
        cdr = x[1:]
        if not  'inf' in numOfArgs and len(cdr) in numOfArgs:
            print ( 'function:'+ proc + ' has '+str(len(cdr)) + ' args, expects: '+str(numOfArgs))
        if x[0] == 'sci':
            args = [x[1]] + [eval(exp, env, depth+1) for exp in x[2:]] # evaluate everything but the name of the instrument
        else:
            args = [eval(exp, env, depth+1) for exp in x[1:]] # here should be the check
        string = '\n'+('  '*depth)+streamFunc( proc , args ) 
        return string



FileIO('test.lisp','output.ck')
os.system("chuck --remove.all")
os.system("chuck + output.ck") 


