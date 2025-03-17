(# table 
	(fillf 128 -1 1))

(step-gen
	(list-walk table 
		(hold (ch -1 1) (ch 1 2 3 4 8 15)))
	(st 1)
	)