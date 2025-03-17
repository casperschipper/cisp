(midi-note-channel-multi
	(reset (walk 82 (ch -5 -7)) (st 82) (st 4))
	(t
		(ch 0.1 0.2 0.3)
		(ch 0.1 0.5 1.5 2. 3.))
	(st 100)
	(loop (rv 1 5) (seq 3) (seq 3))
	(st 1)
	(st 1)
	)