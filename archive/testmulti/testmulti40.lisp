(midi-note-channel-multi
	(reset (walk 60 (ch 12 -12 7 -7 -5)) (st 60) (st 30))
	(ch 0.01 0.1 0.2 0.4)
	(rv 40 100)
	(st 1)
	(line (seq 1 12) (ch 4 8 10))
	(st 2)
	)