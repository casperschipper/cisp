
(fun a 
(bounded-walk -1. 1. (hold 
	(ch -0.1 0.1)
    (ch 1 3 8 16))
	))

(step-gen
(+ 
	(
		(seq a a a a)
		(hold (seq a a a a) (st 2))
		(hold (seq a a a a) (st 4))
		(hold (seq a a a a) (st 8))
		))
(st 4)
)