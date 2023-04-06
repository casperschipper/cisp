(fun c
	(t
		(seq 100 133 144 155 175 250 75 300 67)
		(ch 0.1 0.4 1.0)))

(fun b
	(t
		(index
			(list (st 1) (rv 1 5))
			(weights
				((0 10) (1 1))))
		(ch 0.01)))

(fun a
	(t
		(ch 50 25 2 c c c 400.0001 b)
			(t 
				(ch 0.01 0.02 0.3 0.5)
				(ch 0.1 0.2 0.3 0.5))))



(step-pan-gen
(seq -1 1)
a
(st (rvfi -1 1))
)