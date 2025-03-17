(# tab1 (fillf 256 -1 1))

(samp-schedule
	(write tab1 (list-walk tab1 (ch -1 1)) (count (table-cap tab1)))
	(st 10))

(step-gen
	(seq tab1)
	(st 1)
	)