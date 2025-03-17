(# tab1 (fillf 32 -1 1))


(step-gen
	(index tab1 (~ bus1))
	(st 1))

(fun a
	(line (seq 0 1)
		(ch 1 23 5 7 11 12 15)))

(samp-schedule
	(write tab1 (rv (* -1 a) a) (count2 (table-cap tab1)))
	(st 50))

(~ bus1 (line 
	(seq 0 (table-cap tab1)) 
	(fractRandTimer (grow 0.0001 1.4 25))))


