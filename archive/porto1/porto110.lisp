(# tab1 (list 0.2))

(step-gen
	(write tab1 
		(bounded-walk -1 1 
			(bounded-walk -1 1
				(line (seq -1 1) (* -1 (seq tab1)))))
		(st 0))
	(st 1))