class Foo:
	def __init__(self,args):
		self.args = args

	def bar(self):
		print self.args

	def foobar(self):
		self.bar()

a = Foo("casper")
a.foobar()