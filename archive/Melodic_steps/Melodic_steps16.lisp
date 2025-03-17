(midi-note-channel
	(st 0.25)
	(seq 
	(reset 
		(walk 72 (ch -5 -7))
		(st 72)
		(ch 3 4))
	(reset 
		(walk 72 (ch -5 -7))
		(hold (walk 72 (ch -2 2)) (ch 3 5))
		(ch 3 4)))
	(seq 0.1 0.2 0.1)
	(st 100)
	(st 1))