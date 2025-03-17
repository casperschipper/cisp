(# table 
	(collect (bounded-walk -1 1 (ch -0.01 0.01)) 128))

(# tab2
	(collect (walk 10 (ch -1 1)) 128))

(step-gen
	(list-walk table 
		(hold (ch -1 1) (index tab2 (bounded-walk 0 128 (ch -1 1)))))
	(st 1)
	)