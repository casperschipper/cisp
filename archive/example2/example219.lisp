(fun 
	amp (line (seq 25 110) (ch 3 4 5)))

(midi-note-channel
	(st 0.14)
	(seq (seq 72 70 74 72 70) (seq 67 65 67 65 65 67) (seq 67 67 67 65 65) (seq 60 60 58 60 55))
	(st 0.3)
	(seq 100 amp amp)
	(st 1))