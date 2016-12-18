# this leads to the issue of keywords in general:

A keyword is notated with a :key value. From the [page](http://www.gigamonkeys.com/book/functions.html):
	
	To give a function keyword parameters, after any required, &optional, and &rest parameters you include the symbol &key and then any number of keyword parameter specifiers, which work like optional parameter specifiers. Here's a function that has only keyword parameters:

	(defun foo (&key a b c) (list a b c))
	When this function is called, each keyword parameters is bound to the value immediately following a keyword of the same name. Recall from Chapter 4 that keywords are names that start with a colon and that they're automatically defined as self-evaluating constants.

	If a given keyword doesn't appear in the argument list, then the corresponding parameter is assigned its default value, just like an optional parameter. Because the keyword arguments are labeled, they can be passed in any order as long as they follow any required arguments. For instance, foo can be invoked as follows:

	(foo)                ==> (NIL NIL NIL)
	(foo :a 1)           ==> (1 NIL NIL)
	(foo :b 1)           ==> (NIL 1 NIL)
	(foo :c 1)           ==> (NIL NIL 1)
	(foo :a 1 :c 3)      ==> (1 NIL 3)
	(foo :a 1 :b 2 :c 3) ==> (1 2 3)
	(foo :a 1 :c 3 :b 2) ==> (1 2 3)

# Repeating a function

* It would be useful to be able to repeat a synth definition, both the supercollider variety and the stepgen.
There are currently two possible options:

1. Have it as a type of built-in function ie:
	(repeat 
		(sci ping 
		:freq (seq 10 20 30) 
		:amp (seq 10 20 30) 
		:dur (seq 1 2 3)))

2. Have it as a keyword to such functions. This keyword would be limited to integer values only.

(sci ping 
:freq (seq 100 200 300)
:amp (seq 10 20 30)
:dur (seq 1 2 3)
:repeat 10)



