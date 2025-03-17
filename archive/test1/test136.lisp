(# tab1 (collect ())

(samp-schedule
	(writeover tab1 
		(index-lin tab1 (line (seq 0 44100) (ch 0.1 0.2 1.0 2.0 3.0)))
		(count (table-cap tab1))
	(st 0.5)
	(st 0.5))
	(st 1))




(clone 
(step-gen
	(index-lin tab1 (line (seq 0 44100) (ch 0.1 0.2 1.0 2.0 3.0)))
	(st 1)
	:pan (rvfi -1 1)
	)
1)