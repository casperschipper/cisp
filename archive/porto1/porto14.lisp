(step-gen
	(bounded-walk -1 1 
		(bounded-walk -1 1
			(line (seq -1 1) (ch 0.001 0.01 0.1 0.2))))
	(st 1))