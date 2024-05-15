(fun step2
	(hold
		(ch (rv 100 200) 200 150 133.3333)
		(ch 1 4 8 3)))

(sync 0.15)

(fun mupper 
	(hold (ch 0.5 2.0) (ch 4 8 16 44)))

(sci2
	ping
	(seq 0.14)
	:freq (* (reset (bounded-walk 25 20000 (series 149 100 199 297)) (st 50) (hold (seq 16 5 2 7 2 5 16) (ch 1 1 1 1 1 1 1 1 2))) mupper)
	:duration (seq 0.5 1 1 4 9 2 2 1 0.1 0.1 0.1 0.1)
	:gain (hold (seq 0.1 0.1 0 0.1 0 0.1 0.1 0.1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 2))
	:pos (rv -1 1)
	)