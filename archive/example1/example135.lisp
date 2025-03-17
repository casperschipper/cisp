(# tab1 (100. 3 4 1 23 45 5))

(samp-schedule
	(write tab1 (rv 1 100) (count (table-cap tab1)))
	(st 10000))

(step-gen
	(seq -1 1)
	(index tab1 (walk 0 (ch -1 1))))

