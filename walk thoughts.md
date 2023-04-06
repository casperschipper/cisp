# Stepper functions within Walks

Walks are functions that do something to their previous value to reach a new value, what in mathematics is called a [recurrence relation](https://en.wikipedia.org/wiki/Recurrence_relation).
An example would be the "drunk walk":

	(walk 0 (ch -1 1))

This could result in the sequence:

    -1			0			1			0
	-1			0			-1			-2
	-3			-4			-3			-4
	-3			-4			-5			-6
	-7			-8			-7			-8

Within cisp this is only one type of walk and there are quite some variants:

	(mupwalk 400 (ch 0.5 2.0))

This walk deals would result in:

	400 200 100 200 100 50 100 50 100 200 400 800 1600 etc..

# boundaries

Additional to just taking steps, one could try to check if a boundary meets a certain condition and then take an action,
for example: 

(bounded-walk low high (rv 0 300))

# generalization

Would it be possible to provide general steps, schedule functions making the steps as if they were objects themselves ?
ST_Operator would be able to do this, since it has A and B parameters.
A would be the previous, B would be provided.

The walk now takes an ST_Operator as an argument.
We should have an index for ST_operator selector.

(_ + 3) -> should be parsed to operator
(_ * 3)
(_ general operator)

(/ _ 4)
(bitAnd _ 22)

(walk 0 (index (+ _ 3) (* _3) (rv 0 10))  )









