(# tab1 (fillf 256 -1 1))

(samp-schedule
	(write tab1 
		(list-walk tab1 (hold (ch -1 1) (rv 1 1000))) (count (table-cap tab1)))
	(st 1))

(step-gen
	(seq tab1)
	(st 1)
	)