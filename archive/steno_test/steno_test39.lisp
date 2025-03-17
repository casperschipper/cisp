(# table 
	(fillf 128 -1 1))

(step-gen
	(list-walk table 
		(hold (ch -1 1) (ch 100 200)))
	(st 1)
	)