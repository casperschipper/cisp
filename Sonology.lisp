/*
(~ boundL
	(line (seq 0.5 30)
		(st 7)))

(~ boundH
	(line (seq 0.5 30)
		(st 11))) */

(fun foo
	(rv -0.1 0.1))

(seq 1 2 (seq 1 2 3))

(clone
	(line-gen
		(seq
			(bounded-walk (st -1) (st 1) foo)
			(bounded-walk (st -1) (st 1) foo)
			(bounded-walk (st -1) (st 1) foo)
			(bounded-walk (st -1) (st 1) foo)
			(bounded-walk (st -1) (st 1) foo)
			(bounded-walk (st -1) (st 1) foo)
			)
		(seq
			(bounded-walk (~ boundL) (~ boundH) foo)
			(bounded-walk (~ boundL) (~ boundH) foo)
			(bounded-walk (~ boundL) (~ boundH) foo)
			(bounded-walk (~ boundL) (~ boundH) foo)
			(bounded-walk (~ boundL) (~ boundH) foo)
			(bounded-walk (~ boundL) (~ boundH) foo)
			)) 4)