(define casper
	100)

(define deltap
    100)

(fun a 
	(line
		(seq 0 6)
		(ch 1 3 7)))

(fun step
	(index
		(10 40 60 70 100 120)
		(rv a a)))

(sci2
	voice
	;cassie (wr deltap (rd casper))
	(st 1.0)
	:freq (wr casper
		(apply 
			(rd casper)
			(
			(|= (< 20) step)
			(|= (> 500) step)
			(otherwise 
				(+ (rd casper) (ch step (* -1 step)))
			))))
	:number (st 8000)
	:amp (st 1))

(test (rd thing))