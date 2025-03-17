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
	(st 8))

(step-pan-gen
	(seq tab1)
	(st 1)
	(seq tab2))