(# tab1 (fillf 128 -1 1))



(samp-schedule
	(write 
		tab1
		(rv -1 1)
		(rv 0 (table-cap tab1)))
	(rv 1 1024))


(fun abstract
	(t 
	(ch 0.001 0.02 0.3 0.0001 0.02 0.03)
	(fractRandTimer (ch 0.001 0.02 0.3 0.0001 0.02 0.03))))

(step-pan-gen
	(index-lin tab1 (line (seq 0 (table-cap tab1)) 
		(t (/ 1.0 (mtof (rv 1 130))) abstract) ))
	(st 1)
	(seq tab1)
	)