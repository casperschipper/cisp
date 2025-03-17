(# tab1 (100. 3 4 1 23 45 5))

(# tab2 (fillf 32 -1 1))

(samp-schedule
	(write tab1 (rv 1 100) (count (table-cap tab1)))
	(line (seq 1 10000) (ch 0.1 0.2 0.4 0.5 1.0 1.5)))

(samp-schedule
	(write tab1 (rv -1 1) (count (table-cap tab2)))
	(line (seq 1 10000) (ch 0.1 0.2 0.4 0.5 1.0 1.5)))

(step-pan-gen
	(seq -1 1)
	(index tab1 (walk 0 
		(hold (ch -1 1) (st 1000))))
	(index tab1 (walk 0 
		(hold (ch -1 1) (st 1000)))))

