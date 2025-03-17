(# tab1 (fillf 512 -1 1))

(# tab2 (fillf 512 -1 1))


(samp-schedule
	(write 
		tab1
		(ch tab1)
		(count (table-cap tab1)))
	(st 1))

(step-gen
	(seq tab1)
	(st 1)
	)