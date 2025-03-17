(# tab1 (fillf 4048 -1 1))

(# tab2 (fillf 4048 -1 1))

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
	(t (ch 1 2 3 4 5 6 7 8 16 32 128 1024) (fractRandTimer (ch 0.001 0.02 0.3 0.4 1.0 2.0 4.0))))

(step-pan-gen
	(seq tab1)
	(st 1)
	(seq tab2))