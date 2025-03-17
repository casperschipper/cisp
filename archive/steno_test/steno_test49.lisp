(# table 
	(collect (bounded-walk -1 1 (ch -0.01 0.01)) 128))

(# tab2
	(collect (walk 10 (ch -1 1)) 128))

(step-gen
	(list-walk table (hold (ch -1 0 1) (st 100)))
	(st 1)
	)

(step-gen
	(list-walk table (hold (ch -1 0 1) (rv 1 40)))
	(st 1)
	)

(step-gen
	(list-walk table (hold (ch -1 0 1) (rv 1 100)))
	(st 1)
	)