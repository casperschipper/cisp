

(midi-note
	(seq 
		(latch (st 0) (hold
			(seq 1 3 5 7 11) (seq 15 17 19))) 0.12)	
	(hold
		(seq 
			(hold (seq 60 64 67 62 58 50) (seq 3 2 1 8) ) 
			(hold (seq 64 67 72 64 60) (seq 1 2 5) ) 
			(hold (seq 67 72) (seq 5 7 11) )
			(hold (seq 60 70 72 84) (seq 2 3 2 15 17) ))
		2)
	(st 0.1)
	(st 80)
	)