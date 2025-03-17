(step-gen
	(index 
		(list 
			(tlatch (rv -1 1) (st 1))
			(ch -1 1)
			(hold (seq -1 1) (rv 1 100))
			)
		(t (rv 0 3) (ch 0.1 0.3 0.4 0.5)))
	(st 1))

