(step-gen
	(index 
		(list 
			(latch (rv -1 1) (st 1))
			(seq (fillf 32 -1 1) (rv 1 100))
			(hold (seq -1 1) (rv 1 100))
			)
		(t (rv 0 3) (ch 0.1 0.3 0.4 0.5)))
	(st 1))

