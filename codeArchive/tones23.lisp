(fun one
	(t 
		(seq 1 2.5 3 4.3 5 6)
		(ch 0.1 0.5 0.7 1.1)))

(sci2
	simple
	(st 0.15)
	:freq (* (* (/ one one) 400) (bounded-mup-walk (st 0.1) (st 2.0) (ch 0.999 1.5)))
	:amp (st 0.01)
	:dur (st 2.0))