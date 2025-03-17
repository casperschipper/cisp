(# table 
	(collect 
		(bounded-walk -1.0 1.0 (ch -0.01 0.01))
	512))


(clone 
(step-gen
	(+ 
		(hold (seq table) (weights ((1 1000) (2 1)))))
		
	(st 1)
	:pan (rvfi -1 1))
100)