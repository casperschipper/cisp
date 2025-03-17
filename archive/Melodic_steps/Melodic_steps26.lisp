(midi-note-channel
	(st 0.25)
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
	(seq 0.1 0.2 0.1)
	(seq 100 90 90 75)
	(st 1))