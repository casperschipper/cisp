(step-pan-gen
	(seq -1 1)
	(+ 
		(rv 1 (t (rv 1 100) (ch 0.1 0.2 0.5 1.0)))
	(t
		(ch 1 2 10 40 100)
		(fractRandTimer (ch 0.001 0.01 0.2 2))))
	(hold (seq (fillf 8 -1 1))
	(rv 33 1000)))