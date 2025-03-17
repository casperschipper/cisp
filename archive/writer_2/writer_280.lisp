(# tab1 (fillf 128 -1 1))



(samp-schedule
	(write 
		tab1
		(rv -1 1)
		(rv 0 (table-cap tab1)))
	(rv 1 1024))


(step-pan-gen
	(index-lin tab1 (line (seq 0 (table-cap 128)) (ch 0.01 0.2 0.3 0.4 1.0)) )
	(st 1)
	(seq tab1)
	)