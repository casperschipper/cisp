(# tab1 (fillf 81920 -1 1))

(fun start
	(line
		(rv 0 (table-cap tab1))
		(rv 0 3)))

(fun eind
	(line
		(rv 0 (table-cap tab1))
		(rv 0 3)))

(fun topper
	(line
		(seq 1000 100000)
		(ch 1 2 5 7)))

(fun steps
	(line 
		(seq 1 topper)
			(ch 0.1 0.2 0.5 1.0)))

(fun loo (arg)
	(hold
		arg (ch 1 2 8 16 32)))


(samp-schedule
	(clip 
		(write tab1 
		(* (index-lin tab1 (linseg (loo start) (loo eind) (loo steps))) 2)
		(count (table-cap tab1))) -1 1)
	(st 1))

