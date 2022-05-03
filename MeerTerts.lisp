(sync 0.125)


(midi-note-channel
	(st 0.125)
	(hold 
		(reset 
		(walk 60 (seq 4 3)) (st 55) (seq 3 4 3 1)) (seq 1 1 1 1 1 1 2 2 2 2 2 2 2 2 3 3 3 3 3 2 2 2 2 2 1 1 1 1 ))
	(st 0.5)
	(hold (seq 100 80 70 90) 
		(hold (seq 2 3) (seq 5 13)))
	(st 1.0))