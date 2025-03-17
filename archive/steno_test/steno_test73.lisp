(# table 
	(collect 
		(bounded-walk -1.0 1.0 (ch -0.1 0.1))
	128))


(clone 
(step-gen
	(+ 
		(hold (seq table) (weights ((1 10000) (2 10) (3 1)))))
		
	(st 1)
	:pan (rvfi -1 1))
10)