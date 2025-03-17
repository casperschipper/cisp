(fun a
	(line (seq -1.0 1) (ch 0.001 0.2 0.5 1.0 2.0 3.0))
	)

(step-gen
	(hold 
		(seq a a)
		(line (seq 
			(hold (series 100 150 200) (series 1 2 3))
			(hold (series 125 175 225) (series 2 1 3))
			(hold (series 75 250 275) (series  3 2 1))) (st 0.14)))
	(st 1))