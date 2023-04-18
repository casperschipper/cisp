(fun a
	(t (seq 1 2 1.999 1.0001 ) (ch 0.1 0.05)))

(fun fact
	(t 
	(rv 0.5 1.0)
	(ch 0.3 0.5 1.0 3.0 4.0 6.0)))

(sci2
	simple
	(st 1.0)
	:freq (* (* (st 15000) (/ a a) ) (bounded-mup-walk (st 0.01) (st 32.0) (ch fact fact)))
	:dur (st 15.0)
	:pos (seq -1 0.5 0 0.5 1.0))