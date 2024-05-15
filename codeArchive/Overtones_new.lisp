(sync 0.125)


(midi-note-channel
	(st 0.25)
	(clip 
		(ftom
		(reset 
			(walk 0 
				(hold (seq (seq 100 100 100 100 150 100 133.3333333 150) -33.333333333 -66.666666) 
					(seq
						(latch (st 1) (st 10))
						(latch (st 2) (st 1)))))
			(st 100)
			(seq 5 7 11)
			))
		10 100)
	(st 0.5)	
	(hold (seq 100 80 70 90) 
		(hold (seq 2 3) (seq 5 13)))
	(st 2.0))