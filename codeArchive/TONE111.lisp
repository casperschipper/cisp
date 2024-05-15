(fun harm
	(t
		(rv 0.99 1.0)
		(ch 5.0)))

(fun mupper
	(bounded-mup-walk 
		(st 0.5) (st 8.0)
		(/ harm harm)))

(sci2
	simple
	(line (seq 0.01) (st 4))
	:freq (* (* (st 400) (/ harm harm)) (t mupper (ch 0.5 1.0 2.0 4.0)))
	:dur (line (seq 0.5 15.0) (ch 1 3 5 7 8))
	:amp (st 0.01)
	:pos (rv -1 1))