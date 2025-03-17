(# tab1 (list 0.0))

(step-gen
	(write tab1 
		(bounded-walk -1 1 
			(bounded-walk -1 1
				(line (seq -1 1) (ch 0.001 0.01 0.1 0.2))))
		(st 0))
	(st 1))