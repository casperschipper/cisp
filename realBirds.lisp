(midi-note
	(seq 
		(latch (st 0) (hold
			(seq 2 3 4) (seq 2 3 5 6))) 0.12)	
	(hold
		(seq (seq 60 60 62 64 67) 64 67 (hold (seq 60 70 72 84) (seq 2 3 2 15 17) ))
		2)
	(st 0.1)
	(st 80)
	)