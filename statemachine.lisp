

(step-gen
	(index (list 
		(rv -1 1)
		(st -1)
		(seq (fillf 32 -1 1) true))
	(statemachine
		(list
			(st 0)
			(st 1)
			(st 2)
			(st 0))) true)
	(st 1)
)