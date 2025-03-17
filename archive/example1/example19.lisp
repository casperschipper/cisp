(# tab1 (100. 20 3 2 43 1 4 1 2 42 33 11 2 7))

(samp-schedule 
	(write tab1 (rv 1 100) (rv 0 (table-cap tab1)))
	(line (ch 3 44 55 110 1100 122000 1 10000) (ch 0.1 0.2 0.3 1.0 2.0 3.0)))

(step-gen
	(seq -1 1)
	(index tab1 (walk 0 
		(hold (ch -1 1) (ch 1 2 10 100 200 3000 3000) ))))