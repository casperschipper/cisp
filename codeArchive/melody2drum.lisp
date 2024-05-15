 (midi-note-channel-sync
	(hold (reset (walk 60 (loop (ch -7 -5 5 7) (st 5) (st 3))) (st 60) (st 5)) (ch 1 1 2))
	(st 0.15)
	(seq 100 80 100)
	(st 2)) 


