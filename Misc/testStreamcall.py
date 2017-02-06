class StreamCall(object):
    def __init__(self,name,arguments):
        self.name = name
        self.arguments = arguments
        self.splitKeyed()
    
    def __str__(self):
        return self.__repr__()

    def __repr__(self):
        return self.name + "(" + self.printArguments() + ")" + self.setters()

   

    def splitKeyed(self):
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
                self.extra[key] = item
                # move forward and loop on
                item = snext(iterator)
            else:
                #normal args
                normalArgs.append(item)
                item = snext(iterator)
        self.arguments = normalArgs       

    def printArguments(self):
        return ",".join(self.arguments)

    def setters(self):
        return "\n"+("\n".join(['.'+str(key)+'(' + str(value) + ')' for key,value in self.extra.items()]))
