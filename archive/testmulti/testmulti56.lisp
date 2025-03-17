(midi-note-channel-multi
	(reset (walk 100 
		(hold (seq 12 -12 7 -7 -5) (ch 1 1 1 1 1 1 1 1 1 2))) (st 100) (st 30))
	(hold (ch 0.01 0.02 0.04) (ch 1 2 3 10 20 30))
	(st 64)
	(st 1)
	(seq 3 4)
	(st 2)
	)