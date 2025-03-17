(# tab1 (fillf 44100 -1 1))

(samp-schedule
	(write tab1 
		(index-lin tab1 (line (seq 0 44100) (ch 0.1 0.2 1.0 2.0 3.0)))
		(count (table-cap tab1)))
	(st 10))




(clone 
(step-gen
	(list-walk tab1 (hold (ch -1 1) (ch (grow 1 2 5))))
	(st 1)
	:pan (rvfi -1 1)
	)
10)