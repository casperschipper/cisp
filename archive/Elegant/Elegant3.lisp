(fun a (start) 
	(walk start (hold (ch -2 2) (ch 3 5 6))))

(midi-note-channel
	(st 0.14)
	(seq (a 60) (a 64) (a 67) (a 74) (a 72) (a 70))
	(st 0.5)
	(st 100)
	(st 1))