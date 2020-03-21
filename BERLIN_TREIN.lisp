# afrobeat

(midi-note
	(* (beat 120 4) (seq 1.05 0.95))
	(+ (hold (seq (- 55 7) 55 72) (seq 5 7 5 7 5 7 3))
		(reset 
			(walk 0 (seq 3 4)) 
			(st 0) 
			(seq 3 5 7 (seq 5 11))))
	(seq 0.1)
	(seq 40 (rv 80 120)))