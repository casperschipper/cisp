
(# tab1 
	(list 1. 2 3 4 5 6 7))

(# tab2
	(list 20 30 1 2 3))

(step-gen
	(index 
		(list
			(hold (seq -1 1) (rv 1 10))
			(ch -1 1)
			(hold (seq -1 1) (index tab1 (rv 0 4)))
			(hold (seq -1 1) (index tab2 (rv 0 4)))
			)
		(t 
			(ch 0 1 2 3)
			(st 1)))
	(st 1))