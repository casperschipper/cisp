
(fun walki (guardedWalk
		0 (
			(guardTest (< 128) (st 50))
			(guardTest (> 0) (st 50))
			(otherwise (hold (ch 1 1) (st 10))))))

(test walki)