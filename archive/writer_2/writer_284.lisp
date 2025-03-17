(# tab1 (fillf 128 -1 1))



(samp-schedule
	(write 
		tab1
		(rv -1 1)
		(rv 0 (table-cap tab1)))
	(rv 1 1024))


(step-pan-gen
	(index-lin tab1 (line (seq 0 (table-cap tab1)) 
		(t (/ 1.0 (mtof (ch 1 137 128  120 60 12))) (ch 0.01 0.2 0.3 0.5 1.0 2.0 3.0 4.0)) ))
	(st 1)
	(seq tab1)
	)