(midi-note-channel
	(st 0.2)
	(seq 
		(reset 
			(walk 72 (ch -5 -7))
			(st 72)
			(ch 3 4))
		(reset 
			(walk 72 (ch -5 -7))
				(hold 
					(reset 
							(walk 72 (ch -7 7))
							(st 72)
							(ch 3 6 9))
					(ch 3 4))
		(ch 3 4))
	)
	(line (seq 0.1 1.3) (ch 0.3 0.5 1.0))
	(seq 100 90 90 75)
	(seq 1 2 3))