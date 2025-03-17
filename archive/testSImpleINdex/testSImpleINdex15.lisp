
(# tab1 
	(list 1. 2 3 4 5 6 7))

(# tab2
	(list 101. 20. 30 1 2 3))

(step-gen
	(index 
		(list
			(hold (seq -1 1) (rv 1 10))
			(ch -1 1)
			(hold (seq -1 1) (index tab2 (rv 0 4)))
			(hold (seq -1 1) (index tab1 (line (seq 0 4) (fractRandTimer (ch 0.001 0.2 0.3 3. 5 0.1 0.02 0.1 0.2)))))
			)
		(t 
			(ch 0 1 2 3)
			(fractRandTimer (ch 0.01 0.1 0.2 0.4 0.8))))
	(st 1))