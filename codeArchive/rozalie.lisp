(define casper
	100)

(define deltap
    100)

(sci2
	voice
	;cassie (wr deltap (rd casper))
	(st 0.1)
	:freq (wr casper
		(apply 
			(rd casper)
			(
			(|= (< 20) (ch 100))
			(|= (> 20000) (st 100))
			(otherwise 
				(wr thing (index
					(
						(diff (delay (rd deltap) 100 (line (seq 0 10) (ch 7 13) )))
						(+ (rd casper) (ch 100 40 30 101))
						(* (rd casper) (rv 0.5 1.5)))

					(rv 1 3)))
			))))
	:number (st 1400)
	:amp (st 1))

(test (rd thing))