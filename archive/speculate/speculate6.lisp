(# tab1 (fillf 32 -1 1))


(step-gen
	(index tab1 (~ bus1))
	(st 1))

(~ bus1 (line 
	(seq 0 (table-cap tab1)) 
	(fractRandTimer (ch 0.01 0.1 0.2 0.3 0.5 1.0)))


