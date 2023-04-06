(# tab1 (1. 2 3 4 5 6 7))
(# tab2 (fillf 32 -1 1))

(procedure writeTab
	(# tab1 
		(collect (rv 
			1 (t 
				(ch 1 50 100 20 3 2000) (st 1))
				 ) 
		7)))

(schedule writeTab
		(t (seq 0.01 0.1 0.2 1.0) (ch .1 .5 1. 2)))

(fun ctrlTop
	(t
		(ch 7 7 7 2)
		(ch 4 1 3 7)))

(line-pan-gen
	(seq (fillf 8 -1 1))
	(index tab1 (line (seq 0 ctrlTop) (fractRandTimer (0.001 0.002 0.01 0.02 0.2 0.4 1.6 4 8))))
	(index tab2 (line (seq 0 ctrlTop) (fractRandTimer (0.001 0.002 0.01 0.02 0.2 0.4 1.6 4 8)))))