(midi-note-channel-multi
	(loop (rv 0 128) (st 3) (st 3))
	(t
		(ch 0.1)
		(ch 0.1 0.5 1.5 2. 3.))
	(st 100)
	(loop (rv 1 5) (seq 3) (seq 3))
	(st 1)
	(st 1)
	)