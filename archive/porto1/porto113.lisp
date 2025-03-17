(# tab1 (list 1.0))

(step-gen
	(write tab1 
		(bounded-walk -1 1 
			(bounded-walk -1 1
				(line (seq -0.1 0.1) (* -100 (seq tab1)))))
		(st 0))
	(st 1))