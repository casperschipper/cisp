(fun step2
	(hold
		(ch 100 200 133 105)
		(ch 1 4 8 3)))

(sync 0.14)

(fun mupper 
	(hold (ch 0.5 2.0) (ch 4 8 16 44)))

(sci2
	ping
	(st 0.28)
	:freq (* (reset (walk 100 (ch 0.5 50 step2 150)) (st 200) (hold (seq 2 2 3 2 2 3 5) (ch 1 1 1 1 1 1 1 1 2))) mupper)
	:duration (st 5)
	:gain (hold (seq 0.1 0.1 0 0.1 0 0.1 0.1 0.1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 2))

	)