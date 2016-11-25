import math
import operator as op

Symbol = str          # A Scheme Symbol is implemented as a Python str
List   = list         # A Scheme List is implemented as a Python list
Number = (int, float) # A Scheme Number is implemented as a Python int or float

class Cisp(object):
    def __init__(self,text):
        print( self.parse(text) )
        print( eval(self.parse(text)))
    
    def tokenize(self,chars):
        "Convert a string of characters into a list of tokens."
        return chars.replace('(', ' ( ').replace(')', ' ) ').split()

    def parse(self,program):
        "Read a Scheme expression from a string."
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
    mask = [is_number(x) for x in seq]
    if True in mask and False in mask:
        return [makeStream(x) if mask[ind] else x for ind, x in enumerate(seq) ]
    return seq


def makeStream( arg ):
    return 'st.st('+arg+')'

def makeFunction( functionName, arguments, body ): # something is wrong here !!!
    if arguments == None:
        arguments = [];
    arguments = ",".join(["Stream "+x for x in arguments])
    return "fun Stream ("+arguments+") {\n" + "return "+body+";\n}\n"

def streamFunc(name,arguments):
    if (name in ['st.seq','st.ch'] ):
        arguments = seqMixedTypeFix(arguments)
        arguments = ",".join(arguments)
        formatString = '{funcname}([ {args} ])'
    elif(name == 'list'):
        arguments = seqMixedTypeFix(arguments)
        arguments = ",".join(arguments)
        formatString = '['+arguments+']'
        return formatString
    elif(name == 'stepgen'):
        if len(arguments) != 2:
            print('error, stepgen wrong number of args')
        amp, timer = arguments;
        return """
StepSynth s => Safe safe => dac;

s.init("""+amp+'\n,'+timer+"""\n\n);
"""
        
    else:
        arguments = ",".join(arguments)
        formatString = '{funcname}({args})'
    
    
    return formatString.format(args = arguments,funcname = name)

def caspArray( seq ):
    # never used
    seq = [str(x) for x in seq]
    seq = seqMixedTypeFix(seq)
    seq = ",".join(seq)
    string = '['+seq+']'
    string.replace('\n','')
    return string

def standard_env():
    "An environment with some Scheme standard procedures."
    env = Env()
    env.update({
        'seq': 'st.seq',
        'rv': 'st.rv',
        'line' : 'st.line',
        'ch' : 'st.ch',
        'index' : 'st.index',
        'walk' : 'st.walk',
        'boundedWalk' : 'st.boundedWalk',
        'bouncyWalk' : 'st.bouncyWalk',
        'boundedListWalk' : 'st.boundedListWalk',
        't':'st.t',
        'count' : 'st.count',
        'list' : 'list',
        'st' : 'st.st' ,
        '+' : 'st.sum',
        '-' : 'st.sub',
        '*' : 'st.mup',
        '/' : 'st.div',
        'step-gen' : 'stepgen',
        'bus' : 'st.bus',
        '~' : 'st.bus',
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
    env = global_env
    "Evaluate an expression in an environment."
    
    if isinstance(x, Symbol):      # variable reference
        return env.find(x)[x]
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
        else:
            (_, var, body) = x
            arg = None
        env[var] = var
        for item in arg:
            env[item] = item 
        body = eval(body,env)
        return makeFunction(var,arg,body)      
    else:
        proc = eval(x[0], env, depth+1)
        args = [eval(exp, env, depth+1) for exp in x[1:]] # here should be the check
        string = '\n'+('    '*depth)+streamFunc( proc , args ) 
        return string
        
Cisp("(index (10 11 12 13) (count 3))")
#Cisp("(casper (st 10) (st 22) (st 100))")


