(midi-note-channel-multi
	(reset (walk 60 (seq 12 -12 7 -7 -5)) (st 60) (st 30))
	(rv 0.3 1.5)
	(rv 40 100)
	(st 1)
	(line (seq 1 12) (ch 4 8 10))
	(st 2)
	)