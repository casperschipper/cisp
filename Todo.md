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

<!-- THIS IS WHAT I ENDED UP WITH -->

1. Have it as a type of built-in function ie:
	(repeat 
		(sci ping 
		:freq (seq 10 20 30) 
		:amp (seq 10 20 30) 
		:dur (seq 1 2 3)))


<!-- not so easy to implement, and also counter intuitive -->
2. Have it as a keyword to such functions. This keyword would be limited to integer values only.

(sci ping 
:freq (seq 100 200 300)
:amp (seq 10 20 30)
:dur (seq 1 2 3)
:repeat 10)


# How to deal with context sensitive syntax:

## Statement of problem:

Take this statement as example:

(seq (fillf 32 -1 1))

this will evaluate to:

(seq (fillf 21 -1 1))

st.seq(cs.fillf(32,-1,1))

# How to deal with parameters that are evaluated once per instrument 

a 'special' keyed parameter

(sci2 
synthdefName
(st 0.1)
:freq (st 440)
:duration (st 1.0)
;falp (seq 0 1 2))

There needs to be a type of stream that updates only once per event.
It's value need to be reusable (it can be called twice or more for different parameters, but still returns the same value. It only updates when the event is passed)

How to create streams that have internal feedback.

Imagine, that an SCI Synth always has a "hidden" stream inside that updates once on each event.
The count has to be sent each count to the inner streams that are there (COST !).

There has to be some way of fetching a global value from the environment.


Another strategy is to combine two parameters in a single stream that generates both values (much less beautiful)

(sci
name
(st 0.1)
:freq (index table (~ mySpecialBus))
:duration (index table (~ mySpecialBus)) )

;mySpecialBus (seq 0 1 2 3 4 5 6)

indexer needs to be updated once per event.

Localbus is something that returns the same value, until it's explicity updated () with an update call.
could that update call be an event loop ? Does that event know its context ??

What if we just use normal (~ buses) for the reader. Now that works, the only thing is, that the input stream for the bus needs to be triggered by the external class.

~localBus



## controllers, elements that keep their state intact, between starting (this is very similar to BUS)





