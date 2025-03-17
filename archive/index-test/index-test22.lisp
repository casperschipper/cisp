(step-gen
	(index 
		(
			(line (seq -1 1) (rv 0.01 0.1))
			(line (seq -1 1) (ch 0.001 0.01 0.02))
			(+ (list (rv -1 1) (hold (rv -1 1) (st 2)) (hold (rv -1 1) (st 4)) (hold (rv -1 1) (st 8)))
			(seq (fillf 32 -1 1))
			)
		(t (rv 0 4) (ch 0.1 0.2 0.4))
		)
		
	(st 1))

