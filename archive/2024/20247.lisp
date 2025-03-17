(fun a
	(hold
		(ch 100 80 50 30 10)
		(ch 3 5 7)))

(midi-note-channel-multi
	(st 36)
	(st 1.0)
	(seq a a a)
	(st 1) 
	(st 1)
	(st 2))

(midi-note-channel-multi
	(st 38)
	(st 1.0)
	(seq a a a)
	(st 1) 
	(seq 1 0)
	(st 2))
