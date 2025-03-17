
(fun a
	(hold
		(ch 100 40 120)
		(ch 3 5 7)))

(midi-note-channel-multi 
	(ch 36)
	(st 0.1)
	(ch a a a)
	(st 10)
	(seq 1 )
	(st 2)) 
