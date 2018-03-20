(define
	casper
	10)



(step-gen
	(wr casper 
		(apply 
			(rd casper)
			(
			(| (< 10) (* 2))
			(| (> 1000) (st 200))
			(guard (rv -10 10))
			)))
	(st 1)
	)