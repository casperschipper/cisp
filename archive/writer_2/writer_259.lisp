(# tab1 (fillf 512 -1 1))

(# tab2 (fillf 512 -1 1))


(samp-schedule
	(write 
		tab1
		(index tab1 (rv 0 511))
		(count (table-cap tab1)))
	(hold (ch 1 2 3 4 8 16 32) (ch 1 2 4 128 256 512)))

(samp-schedule
	(write 
		tab1
		(rv -1 1)
		(count (table-cap tab1)))
	(ch 1 2 3 4 8 16 32))

(samp-schedule
	(write 
		tab1
		(st 0)
		(count (table-cap tab1)))
	(ch 1 2 3 4 8 16 32))

(step-gen
	(seq tab1)
	(st 1)
	)