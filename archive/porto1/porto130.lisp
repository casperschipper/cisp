(# tab1 (list 0.4))

(step-gen
	(write tab1 
		(bounded-walk -1 1 
			(bounded-walk -0.01 0.01
				(line (seq -0.1 0.1) 
					(index OSC.table1 
						(+ (rv 0.1 10) (* 512.0 (index tab1 (st 0))))))))
		(st 0))
	(st 1))
