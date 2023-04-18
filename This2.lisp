
(fun bah
	(statemachine (list 
		(st 1)
		(weights ((2 20) (7 1)))
		(weights ((3 20) (6 1)))
		(weights ((4 30) (0 2)))
		(weights ((5 40) (7 4)))
		(weights ((6 20) (1 2)))
		(weights ((7 30) (1 2)))
		(weights ((0 30) (1 1) (7 1)))
		)))

(fun a
	(index (list 0.25 0.1 1.0 2.0 0.99 4.0 ) bah))

(fun fluid
	(line (ch 0.05 0.07)
		(ch 0.3 4.0 8.0 10.0)))

(fun mupper
	(t 
	(bounded-mup-walk
		(st 12)
		(st 512.0)
		(ch 0.5 2.0))
	(ch 0.5 1.0 2.0)))


(sci2
	simple
		fluid
		:freq (* (/ a a) 400)
		:dur (st 0.2)
		:amp (st 0.02)
		:pos (rv 0 1))