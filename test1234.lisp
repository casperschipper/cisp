(fun b
	(t 
	(ch
		(rv 1 10)
		(rv 1 100)
		(rv 1000 2000))
	(ch 3 7 11)))

(fun a
	(t
		(ch b b b b b b b )
		(rv 0 1)))

(clone
(step-pan-gen
(loop (seq (fillf 32 -1 1)) (ch 2 3 4) (ch 2 3 20))
(seq a a a a a a a a a)
(loop (seq (fillf 32 -1 1)) (ch 2 3 4) (ch 2 3 20))
)
30)