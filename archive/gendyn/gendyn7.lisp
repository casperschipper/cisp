
(fun a 
(bounded-walk -1. 1. (ch -0.01 0.01)))

(step-pan-gen
(+ 
	(
		(seq a a a a)
		(hold (seq a a a a) (st 2))
		(hold (seq a a a a) (st 4))
		(hold (seq a a a a) (st 8))
		))
(st 4)
(hold (seq a a a a) (st 8)))