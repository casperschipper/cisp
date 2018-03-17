(test (guardedWalk 0 
	(
		(guardTest (< 30) (+ 10))
		(guardTest (> 300) (- 1))
		(guard (+ 1)))))