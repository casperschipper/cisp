(# tab1 (0.001 0.002 0.001 0.2 0.4 0.5 0.6 1.0 3.0))

(fun indi 
	(line
		(seq 0 (table-cap tab1))
		(ch 1 3 5 7))
	)

(fun freq
	(bounded-mup-walk (st 20) (st 2000) (ch 0.5 2.0 0.75 1.5)))

(step-gen
	(cycle 

		(t freq (index tab1 (rv indi indi))))
	

	(st 1))