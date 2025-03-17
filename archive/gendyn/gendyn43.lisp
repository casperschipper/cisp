
(~ amp
	(line (series 0.001 0.02 0.0003 0.00005)
		(ch .1 .3 .5 .7 2 3))
	)

(fun a 
(bounded-walk -1. 1. (hold 
	(ch (* -1 (~ amp)) (~ amp))
    (ch 1 3 8 16))
	))


(fun b
(bounded-walk 1 3 (hold 
	(ch -0.001 0.001)
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
		(t (ch 1 2 3 4 5 6) (ch 1 2 3 5 6))
		))
:pan (rvfi 0 1)
)