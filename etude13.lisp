(# tab1 (alloc 128))

(~ updateSpeed
	(t
		(rv 1 100)
		(seq 3 5 1 4 2 6)))

(~ updateSpeed1
	(t
		(rv 1 100)
		(seq 3 5 1 4 2 6)))

(fun a
	(t
		(seq 0.01 0.1 -0.2 0.001 0.0)
		(ch  0.5 1 2)))

(samp-schedule
	(write 
		tab1
		(bounded-walk (st -1) (st 1) (seq a a))
		(count (table-cap tab1))
		)
	(~ updateSpeed1))

(clone
(step-gen 
	(list-walk tab1 (hold (seq -1 1) (rv (~ updateSpeed1) (~ updateSpeed))))
	(st 6)
	:pan (rvfi -1 1))
1)