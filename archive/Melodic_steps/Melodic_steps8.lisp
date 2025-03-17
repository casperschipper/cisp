(midi-note-channel
	(st 0.25)
	(seq 
	(reset 
		(walk 72 (ch -5 -7))
		(st 72)
		(ch 3 4))
	(reset 
		(walk 72 (ch -5 -7))
		(st 72)
		(ch 3 4)))
	(seq 0.2 0.2 0.2 0.01)
	(st 100)
	(st 1))