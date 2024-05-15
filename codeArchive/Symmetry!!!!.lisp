(sync 1)

(fun a
	(hold
	(seq 9 12 19 14 16 24)
	(rv 1 12)))

(sci2
	casper
	(st 0.14)
	:freq (mtof (+ 
		(+ 
		(seq 0 (seq 5 5 5 5 5 5 5 4) 7) 
		(hold (seq 0 5 (seq a a a a a a a a a a 0 2) 7) (seq 3 5 4 3 5 2 2 3 4 5 3)))
		48))
	:duration (st 1.0)
	:amp (seq 0.1 0.05 0.1 0.05 0.1))
