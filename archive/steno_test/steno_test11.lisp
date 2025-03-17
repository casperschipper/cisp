(step-gen
	(hold (seq -1 1) 
		(t (seq 
			(hold (ch 10 100 200) (seq 1 2 3))
			(hold (ch 125 150 250) (seq 2 1 3))
			(hold (ch 110 160 180) (seq  3 2 1)) (st 0.14)))
	(st 1))