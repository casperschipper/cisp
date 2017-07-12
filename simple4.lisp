(fun freqStep
	(t
		(ch -33 -100 -66 -70)
		(t (ch 1 2 4) (ch 1 2 4))))

(sci2 
	simpleSine
	(st 0.05)
	:freq (bounded-walk 100 500 freqStep)
	:duration (st 0.2)
	:pan (bounded-walk -1 1 (st 0.1))
	)