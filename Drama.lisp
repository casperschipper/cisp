(clone
(step-gen
	(seq -.1 .1)
	(+ 
		(t
			(index 
				(100 200 300 400 101 99) 
				(bounded-walk 0 3 (ch -1 1)))
				 (st .2))
		(hold (ch 10 -10 20 30) (st 3)))
	) 3)