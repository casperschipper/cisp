
(~ amp
	(line (series 0.01 0.1 0.5 0.0001)
		(ch 1 3 5 7))
	)

(fun a 
(bounded-walk -1. 1. (hold 
	(ch (* -1 (~ amp)) (~ amp))
    (ch 1 3 8 16))
	))


(fun b
(bounded-walk 1 3 (hold 
	(ch -0.01 0.01)
    (ch 1 3 8 16))
	))

(line-gen
(+ 
	(
		(seq a a a a)
		(hold (seq a a a a) (st 2))
		(hold (seq a a a a) (st 4))
		(hold (seq a a a a) (st 8))
		))
(+ 
	(
		(seq b b b b)
		(hold (seq b b b b) (st 2))
		(hold (seq b b b b) (st 4))
		(hold (seq b b b b) (st 8))
		))
)