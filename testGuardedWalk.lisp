// Guarded test starts with startValue 

(test
	(guardedWalk
		100 (
			(| (< 10) (* (ch 2 3)))
			(| (> 10000) (/ (ch 2 3)))
			(guard (* (ch 0.5 2.0))))))



