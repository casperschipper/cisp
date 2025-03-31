(fun a
	(line 
		(seq -1 1)
		(ch 0.001 0.02 0.3)))

(step-gen
(seq a a a a)
(hold (ch 1 2 3 4 5 6 7 8 9) (ch 300 15000 441000))
)