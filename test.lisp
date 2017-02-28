(fun casper 
	(line 
		(seq 1 100)
		(rv 1 4)))

(sci saw 
	(st 0.12)
	(loop 
		(stream-weights (100.0 200 300 400) (list casper casper casper casper))
		(st 4)
		(st 4))
	(line (rv 0.1 1.0) (rv 1 10)))
