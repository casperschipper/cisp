(# tab1 (fillf 32 -1 1))


(step-gen
	(index tab1 (~ bus1))
	(st 1))

(~ bus1 (line 
	(seq 0 (table-cap tab1)) 
	(fractRandTimer (grow 0.001 1.05 10))))


