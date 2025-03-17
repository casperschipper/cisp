(# tab1 (fillf 128 -1 1))



(samp-schedule
	(write 
		tab1
		(rv -1 1)
		(rv 0 (table-cap tab1)))
	(rv 1 1024))


(step-pan-gen
	(seq tab1)
	(st 1)
	(seq tab1)
	)