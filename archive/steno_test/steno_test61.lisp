(# table 
	(collect (bounded-walk -1 1 (ch -0.01 0.01)) 128))

(# tab2
	(collect (walk 10 (ch -1 1)) 128))

(step-gen
	(list-walk table (hold (ch -1 1) (ch 1 1000 2000)))
	(st 1)
	:pan (rvfi 0 1)
	)

(step-gen
	(list-walk table (hold (ch -1 1) (rv 3000 4000)))
	(st 2)
	:pan (rvfi 0 1)
	)

(step-gen
	(list-walk table (hold (ch -1 1) (rv 10000 1000)))
	(st 3)
	:pan (rvfi 0 1)
	)

(step-gen
	(list-walk table (hold (ch -1 1) (rv 10000 1000)))
	(st 4)
	:pan (rvfi 0 1)
	)