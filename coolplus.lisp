(define
	casper
	0.1)



(step-gen
	(wr casper 
		(apply 
			(rd casper)
			(
				(|= (< -1) (st 0.1))
				(|= (> 1) (st 0.1))
				(|= (< 0.000001) (st 0.1))
				(guard (* (t (ch 0.5 2.0 0.25 0.6667 1.5) (ch .1 .05)))))))
	(st 1)
	)