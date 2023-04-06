(fun c
	(t
		(seq 200 201 66.6666666)
		(ch 0.1 0.4 1.0)))

(fun b
	(t
		(index
			(list (st 1) (rv 1 5))
			(weights
				((0 10) (1 1))))
		(ch 2)))

(fun a
	(t
		(seq c c c)
			(t 
				(ch 0.1 2 8)
				(ch 0.1 0.2 0.3 0.5))))



(step-pan-gen
(seq (fillf 8 -1 1))
(/ a 4)
(st (rvfi -1 1))
)