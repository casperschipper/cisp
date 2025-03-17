(midi-note-channel
	(st 0.14)
	(+ 
		(seq 
			(hold (seq 0 2 -2) (st 5)) 4 
			(hold (seq 7 9 12) (seq 2 3))
		) 60)
	(st 0.1)
	(st 100)
	(st 1)
)