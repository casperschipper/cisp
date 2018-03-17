(test
	(guardedWalk
		100 (
			(guardTest (< 10) (+ 1))
			(guardTest (> 1000) (- 2)))))