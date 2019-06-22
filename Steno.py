import string

def flatten(seq):
    listed = [x if type(x) == list else [x] for x in seq]
    return [val for sublist in listed for val in sublist]

        
class Steno:
    def __init__(self,input):
        print 'input='+input
        self.parts = input.split(' ')	# split by ' ' space

    def parse(self): 
	# generators, should deal with '1!2' and '1..10'
	# [1,1] & [1,2,3,4,5,6,7,8,9,10]
        return map(self.parsePart,self.parts)

    def parsePart(self,item):
	# deal with ints and floats
	try:
        return int(item)
	except ValueError:
        try:
            return float(item)
	    except ValueError:
        # it aint a float or an int, so must be a gen:
	        return self.gen(item)

    def gen(self,item):
        if len(item) == 1:
            try:
                return int(item)
            except ValueError:
                return item.index(string.ascii_lowercase)
        else:
            print "is not single value"
            if ("!" not in item) and (".." not in item): 
                chars = list(item)
                # it is a 'abc' kind of steno
                return map(lambda chars : item.index(string.ascii_lowercase), chars)
            else:
                elements = item.partition("!")
                    # it is using some kind of shorthand
                if (elements[1] != ""):
                    try:
                        value = int(elements[0])
                        repeats = int(elements[2])
                        return [value for _ in range(repeats)]
                    except ValueError:
                        raise Exception("sorry, don't know what to do with this:"+elements)
                else:
                    elements = item.partition("..")
                    if (elements[1] != ""):
                        try:
                            start = int(elements[0])
                            end = int(elements[2])
                            return range(start,end)
                        except ValueError:
                            raise Exception("sorry, don't know what to do with this:"+elements)
                    else:
                        raise Exception('steno error, invalid use :' + item)

    def __repr__(self):
        
        return str(flatten(self.parse()))

    def __str__(self):
    	return self.__repr__();

# test
# print str(Steno('1!10 1..10 1 2 3 2.3'))
