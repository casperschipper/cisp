(# tab1 (fillf 4048 -1 1))

(# tab2 (fillf 4048 -1 1))



(samp-schedule
	(write 
		tab1
		(rv -1 1)
		(rv 0 (table-cap tab1)))
	(rv 1 1024))


(step-pan-gen
	(seq tab1)
	(st 2)
	(seq tab1)
	)