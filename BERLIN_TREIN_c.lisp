# afrobeat

(sync 0.125)

(midi-note-channel
	(seq (* (beat 120 4) (seq 1.05 0.95)))
	(+ 
		(+ (hold (seq (- 55 7) 55 (- 55 12)) (seq 5 7 5 7 5 7 3))
			(reset 
				(walk 0 (seq 3 4)) 
				(st 0) 
				(seq 3 5 4 (seq 5 3))))
		(seq 0 7 12 true))
	(seq 0.1)
	(seq 100 (rv 80 120))
	(hold (seq 1 2) (hold (seq 1 2) (seq 2 3 3 2 3))))


(sync 0.125)

