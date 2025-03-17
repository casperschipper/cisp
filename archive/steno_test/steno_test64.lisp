(# table 
	(collect 
		(bounded-walk -1.0 1.0 (ch -0.01 0.01))
	512))


(step-gen
	(+ 
		(seq table) 
		(hold (seq table) (weights ((1 1000) (2 1)))))
	(st 1))