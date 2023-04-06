(clone
(sci2
	ping
	(st 0.12)
	:freq (mtof
		(+
			(loop (seq 
				(seq 0 (seq 4 5 4 4 5 6) 7)
				(seq 0 2 (seq 7 7 9 12 5) 12 2)
				(seq 2 7 0 (seq (seq 0 -2 0 0 0 24) 7 7 7 14) 2 0 7 7))
				(seq 2 4 2)
				(seq 3 4 2 3))
			60)
		)
	:duration (st 0.5)) 3)