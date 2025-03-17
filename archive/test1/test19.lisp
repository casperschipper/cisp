(# tab1 (fillf 256 -1 1))

(samp-schedule
	(write tab1 (rv -1 1) (count (table-cap tab1)))
	(st 1))

(step-gen
	(seq tab1)
	(st 1)
	)