(fun a
	(t (ch 1 2 3 4 5 6 7)

		(t 
			(ch 0.1 0.5 1.0 2.0 3.0 6.0 12.0 24.0)
			(ch 0.001 0.1 0.2 0.4 0.5))))

(clone 
(step-gen
	(seq (fillf 32 -1 1))
	(seq a a)
	:pan (rvfi -1 1))
    10)