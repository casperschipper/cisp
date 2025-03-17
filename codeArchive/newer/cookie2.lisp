(midi-note-channel
	(st 0.25)
	(seq 
		(~ a)
		(~ b)
		(~ c))
	(st 0.15)
	(st 100.0)
	(seq 1 2))

(~ a (hold (seq 60 62) (seq 5 7)))
(~ b (seq 64 67))
(~ c (ch 88 84 82))