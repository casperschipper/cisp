(fun a (start) 
	(walk start (hold (ch -2 2) (ch 3 5 6))))

(midi-note-channel
	(st 0.14)
	(seq (a (st 60)) (a (st 64)) (a (st 67)) (a (st 74)) (a (st 72)) (a (st 70)))
	(st 0.5)
	(st 100)
	(st 1))