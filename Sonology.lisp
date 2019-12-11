(fun foo
	(*
		(line 
			(sometimes (rv 0.1 1.0) (st 0.0001) (st 10)) 
			(ch .1 .3 .7))
		(ch -1 1)))


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
		(bounded-walk (st 1) (st 10) foo)
		(bounded-walk (st 1) (st 10) foo)
		(bounded-walk (st 1) (st 10) foo)
		(bounded-walk (st 1) (st 10) foo)
		(bounded-walk (st 1) (st 10) foo)
		(bounded-walk (st 1) (st 10) foo)
		))