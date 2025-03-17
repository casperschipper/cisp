// time pitch duration velo channel

(midi-note-channel
	(line (seq 1.0 0.5) (ch 1 3 5 7 10))
	(loop 
		(reset 
			(walk 60 (ch -12 12))
			(st 60)
			(rv 5 10)) (st 3) (st 3))
	(line (seq 0.1 3.0) (ch 1 3 5 7 10))
	(st 100)
	(st 2))



