(# table 
	(collect (bounded-walk -1 1 (ch -0.01 0.01)) 128))

(# tab2
	(collect (walk 10 (ch -1 1)) 128))

(step-gen
	(list-walk table (ch -1 1))
	(st 1)
	)