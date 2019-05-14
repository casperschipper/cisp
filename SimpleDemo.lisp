(fun beginpoint
	(line
		(ch 0 2 4 128)
		(t
			(ch .1 0.001 0.05 0.1 0.4 2 4)
			(ch .1 0.2 0.05 0.001 2 4))))


(step-gen
	(index
		(fillf 256 -1 1)
		(reset
		(bounded-walk 0 32 
			(hold
				(ch -1 1)
				(ch 1 2 4 8 16 32)))
		(st 0)
		beginpoint)
		)
	(st 1))