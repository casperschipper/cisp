(step-pan-gen
	(hold 
		(rv -1 1) 
		(reset 
			(walk 0 (ch 1. 1 1 1 1 2)) (st 1) (bounded-walk 0 100 (ch -1 1))))
	(st 1)
	(hold 
		(rv -1 1) 
		(reset 
			(walk 0 (ch 1. 1 1 1 1 2)) (st 1) (bounded-walk 0 100 (ch -10 10)))))