(fun liner
	(line 
		(seq 1.0 0.4)
	(rv 5 10)))

(sci2
	simpleSine
	(st 0.05)
	:gain (st 0.01)
	:freq (reset (bounded-mup-walk (st 20) (st 8000) liner) (st 8000) (ch 10 20 40))
	:duration (ch 3.0 6.0)
	:pan (rv -1 1)
	)