(fun 
	amp (line (seq 25 110) (ch 3 4 5)))

(fun walker
	(hold (reset 
		(walk 72 (ch -5 5 -2 2))
		(st 72)
		(rv 5 6))
	(ch 3 5)))


(midi-note-channel
	(rv 0.01 0.14)
	(seq walker walker walker walker)
	(st 0.3)
	(seq 100 amp amp)
	(st 1))