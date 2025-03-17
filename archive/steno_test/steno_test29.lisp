(fun a
	(line (seq -1.0 1) (ch 0.001 0.2 0.5 1.0 2.0 3.0))
	)

(fun tcontrol
	(line (seq 1 1000) (ch 1 2 3 4)))

(step-gen
	(hold 
		(seq a a)
		(line (seq 
			(hold (series 10 15 20) (series 1 2 3))
			(hold (series 12 17 22) (series 2 1 3))
			(hold (series 7 25 27) (series  3 2 1))) (/ 1.0 tcontrol)))
	(st 1)
	:pan (rvfi -1.0 1))
