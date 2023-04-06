(midi-note
(beat 120 4)
(+ (hold (seq (- 55 7) 55 72) (seq 5 7 5 7 5 7 3))
		(reset 
			(walk 0 (seq 3 4)) 
			(st 0) 
			(seq 3 5 7 (seq 5 11))))
(st 0.05)
(st 80)
)