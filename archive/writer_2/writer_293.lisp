(# tab1 (fillf 128 -1 1))



(samp-schedule
	(write 
		tab1
		(rv -1 1)
		(rv 0 (table-cap tab1)))
	(rv 1 1000))


(fun abstract
	(t 
	(ch 0.001 0.02 0.3 0.0001 0.02 0.03)
	(fractRandTimer (ch 0.001 0.02 0.3 0.0001 0.02 0.03 0.2 0.5 0.9 1.3))))

(step-pan-gen
	(index-lin tab1 (line (seq 0 (table-cap tab1)) 
		(t (/ 1.0 (mtof (q (rv 1 130) 12))) abstract) ))
	(st 1)
	(hold (seq tab1) (t (seq 1 1000) (ch 1 3 5 7)))
	)