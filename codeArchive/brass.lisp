(fun seven
	(hold (seq 7 14 8)
	(seq 5 13)))

(fun twelve
	(hold
		(seq 12 19 24 48 -12 0)
		(seq 11 17)))

(midi-note
	(st 0.14)
	(+ (seq 64) 
		(index ((hold (seq 0 -7) (seq 7 5)) (hold (seq 4 7 2 0) (seq 2 3 2 3 2 2 3)) seven twelve) 
			(+ (count 5) (count2 (seq 2 3)))))
	(st 0.1)
	(st 100)
	)