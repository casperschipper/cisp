(# ptable (sine 16 (1.0)))

(fun top
	(line
		(seq 1.9 1.01 1.9)
		(st 7)))

(fun a (t 
		(seq (rv 0.99 top) 2 3 4 5 6 7)
		(rv 0.1 0.2)	
		))

(fun mupper
	(t
		(reset 
			(mup-walk 1.0 (hold (seq 0.5 2.0) (rv 2 3))) 
				(st 1.0) 
				(st 8))
		(rv 1 2)))

(sci2
	simple
	(st 0.001)
	:freq (* (* (/ a a) 400) mupper)
	:dur (st 5.0)
	:amp (st 0.01)
	:pos (seq ptable))