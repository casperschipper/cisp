(fun two
	(hold
		(ch 2 5)
		(ch 3 2 4)))

(midi-note-channel
	(seq 0.14 0.12)
	(+ 
		(
			(hold (seq -12 0 two 12) (seq 2 2 2 1))
			60 
			(hold (seq 0 7 0 7 0 14) (seq 1 1 1 1 1 2)))
		)
	(ch 0.14 0.14 0.14 0.14 0.14 1.0)
	(seq 100 80)
	(st 1))