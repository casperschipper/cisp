(fun liner
	(line
	(seq 0 6)
	(ch 0.1 0.5 1. 3. 4)))

(fun masked
	(index 
		(list (1 3 4 7 12))
		(rv liner liner)))

(midi-note-channel
	(st 0.14)
	(walk 60 (* (ch -1 1) masked))
	(st 1.0)
	(st 70)
	(st 1))

