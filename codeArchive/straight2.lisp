(define casper
	100)

(define deltap
    100)

(# interval (.1 3 2 0.5 10 40 60 70 100 120))

(fun a 
	(line
		(seq 0 (table-cap interval))
		(ch 1 3 7)))

(fun step
	(index
		interval
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
			(|= (> 1000) step)
			(otherwise 
				(+ (rd casper) (ch step (* -1 step)))
			))))
	:number (st 8000)
	:amp (st 1))

(test (rd thing))