(# tab1 (fillf 128 -1 1))

(# tab2 (fillf 128 -1 1))

(samp-schedule
	(+ 
		(
			(write tab1 
			(rv -1 1)
			(count (table-cap tab1))
			)
			(write tab2
			(rv -1 1)
			(count (table-cap tab1))
			)
		))
	(t (ch 1 2 3 4 5 10 24 40) (fractRandTimer (ch 0.001 0.02 0.3 0.4 1.0 2.0 4.0))))

(step-pan-gen
	(seq tab1)
	(st 1)
	(seq tab2))