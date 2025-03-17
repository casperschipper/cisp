(# tab1 (100. 20 3 2 43 1 4 1 2 42 33 11 2 7))

(samp-schedule 
	(write tab1 (rv 1 100) (rv 0 (table-cap tab1)))
	(st 1000))

(step-gen
	(seq -1 1)
	(index tab1 (walk 0 (ch -1 1))))