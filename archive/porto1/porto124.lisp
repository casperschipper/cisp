(# tab1 (list 0.01))

(step-gen
	(write tab1 
		(bounded-walk -1 1 
			(bounded-walk -0.01 0.01
				(line (seq -0.1 0.1) (index tab1 (st 0)))))
		(st 0))
	(st 1))
