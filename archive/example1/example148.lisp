(# tab1 (100. 3 4 1 23 45 5))

(# tab2 (fillf 4 -1 1))

(samp-schedule
	(write tab1 (rv 1 10) (count (table-cap tab1)))
	(line (seq 1 10000) (ch 0.1 0.2 0.4 0.5 1.0 1.5)))

(samp-schedule
	(write tab2 (rv -1 1) (count (table-cap tab2)))
	(line (seq 1 10000) (ch 0.1 0.2 0.4 0.5 1.0 1.5)))

(fun a 
	(line (seq 1 1000) 
		(t 
			(ch 0.01 0.02 0.05 1.0 2.0)
			(ch 0.1 0.2 0.5 1.0 2.0))))

(step-pan-gen
	(seq -1 1)
	(index tab1 (walk 0 
		(hold (ch -1 1) a)))
	(index tab2 (walk 0 
		(hold (ch -1 1) a))))

