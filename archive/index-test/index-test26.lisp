(step-gen
	(index 
		(
			(line (seq -1 1) (/ 1.0 (rv 1 10000))
			(line (seq -1 1) (ch 0.001 0.01 0.02))
			(+ (list 
				(ch -1 1) 
				(hold (ch -1 1) (st 2)) 
				(hold (ch -1 1) (st 4)) 
				(hold (ch -1 1) (st 8))
				(hold (ch -1 1) (st 16))
				(hold (ch -1 1)) (st 32)))
			(seq (fillf 32 -1 1))
			)
		(t (rv 0 4) (ch 0.1 0.2 0.4))
		)
		
	(st 1))

