class UniqueName:
    def __init__(self):
        self.contexts = {}

    def name(self,context):
        if context in self.contexts.keys():
            self.contexts[context] += 1
            return context+"_" + str(self.contexts[context])
        else:
            self.contexts[context] = 1
            return context+"_1"

test = UniqueName()
print (test.name('sc'))
print (test.name('sc'))
print (test.name('sc'))
print (test.name('casp'))
print (test.name('func'))
print (test.name('casp'))

