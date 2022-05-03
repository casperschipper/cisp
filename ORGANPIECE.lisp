(midi-note-channel 
	(* (/ 15.0 60) (seq 1.))
	(guardedWalk
		40 (
			(| (< 0) (+ 7))
			(| (> 90) (- (ch 48)))
			(guard (+ 
				(seq 
					(latch (seq 12 7 7 7 12) (seq 2 3 5)) 
					(latch (seq -7 -12) (st 1)))))))
	(seq (seq 0.3 1.8 0.3 0.3) 0.1 0.1 0.5 0.1 0.1)
	(seq 128 60 80)
	(st 1))