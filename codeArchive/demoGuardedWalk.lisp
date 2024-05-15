// Guarded test starts with startValue 

(fun freq
	(guardedWalk
		100 (
			(| (< 50) (* (ch 2 3)))
			(| (> 4000) (/ (ch 2 3)))
			(guard (* (ch 0.5 2.0))))))

(step-gen
	(seq -1 1)
	(t (/ 44100 freq) .07))





