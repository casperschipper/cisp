(fun two
	(hold
		(ch 2 5)
		(ch 3 2 4)))

(sync 0.1)

(midi-note-channel
	(seq 0.14 0.12)
	(+ 
		(
			(hold (seq -12 (seq 0 -7 7) two 12) (seq 2 2 2 1))
			60 
			(hold (seq 0 7 0 7 0 14) (seq 1 1 1 1 1 2))
			(hold (seq 0 0 0 0 0 5 (seq 0 5 10 true) 0 0 0 2) (seq 1 1 1 1 1 1 1 5)))
		)
	(st 0.12)
	(seq 100 80)
	(st 1))