(midi-note-channel-multi
	(reset (walk 60 
		(hold (seq 12 -12 7 -7 -5) (ch 1 2 3 4 5))) (st 60) (st 30))
	(hold (ch 0.01) (ch 10 20 30))
	(rv 40 100)
	(st 1)
	(line (seq 1 12) (ch 4 8 10))
	(st 2)
	)