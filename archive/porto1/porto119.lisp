(# tab1 (list 1.0))

(step-gen
	(write 
		(bounded-walk -1 1 
			(bounded-walk -0.01 0.01
				(line (seq -0.1 0.1) (index tab1 0))))
		(st 0) tab1)
	(st 100))
