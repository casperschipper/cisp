



(# OSC.table1 
	(100. 200 300 400 500))

(~ replaceOne
	(write OSC.table1
		(ch 
			(* (ch OSC.table1) (ch 0.5 1.5 0.75 1.2)) 
			(ch 100 200 300 400 500))
		(rv 0 5)))

(schedule
	(~ replaceOne)
	(st 1.0))

(fun lengthController
	(line
		(seq 0.1 0.1 0.1 0.1 0.1 0.1 1.0 0.03) 
		(ch (grow 0.1 2 8))))


	(sci2 
		saw
		(st 1.0)
		:fuck (st 1.0)
		:freq (hold (seq OSC.table1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 8))
		:duration (st 1.0)
		)



