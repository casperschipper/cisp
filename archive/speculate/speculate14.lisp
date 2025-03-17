(# tab1 (fillf 32 -1 1))


(step-gen
	(index tab1 (~ bus1))
	(st 1))

(samp-schedule
	(write tab1 (ch -1 1) (count2 (table-cap tab1)))
	(st 500))

(~ bus1 (line 
	(seq 0 (table-cap tab1)) 
	(fractRandTimer (grow 0.0001 1.333333 20))))


