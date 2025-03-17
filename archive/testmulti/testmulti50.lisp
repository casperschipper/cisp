(midi-note-channel-multi
	(reset (walk 100 
		(hold (seq 12 -12 7 -7 -5) (ch 1 1 1 1 1 1 1 1 1 2))) (st 100) (st 30))
	(hold (ch 0.01 0.2) (ch 1 2 3 10 20 30))
	(seq 40 100 20)
	(st 1)
	(line (seq 1 12) (ch 4 8 10))
	(st 2)
	)