(step-gen
	(hold (seq -1 1) 
		(t (seq 
			(hold (ch 100 150 200) (seq 1 2 3))
			(hold (ch 125 175 225) (seq 2 1 3))
			(hold (ch 75 250 275) (seq  3 2 1))) (st 0.14)))
	(st 1))