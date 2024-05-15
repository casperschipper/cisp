(test (guardedWalk
		100.0 (
			(guardTest (> 4000) (overwrite (st 100)))
			(guardTest (< 1.0) (overwrite (st 100)))
			(guardControl (ch 0 1) (+ 0.02))
			(guardControl (ch 0 1) (* 2))
			(guard (* (ch 0.5 1.5))))))