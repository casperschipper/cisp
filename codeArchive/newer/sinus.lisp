(fun chopper
	(line
		(seq 0.0 1)
		(t 
			(ch 0.1 0.2 0.3 0.4 0.5 1.0)
			(ch 1 2 3))))

(fun freq
	(t 
		(ch 100 99 200.01 50 10.0)
		(ch 0.1 0.2 0.5 1.0 2.0))
	)

(fun walker
	(line (ch -1 1) (/ 1.0 freq))
	)
	

(fun walker2
	(t
		(reset (mup-walk (~ casperGaatDit) (ch 0.99 1.01 0.5 1.2)) (st 500) (rv 4 10))
		(* (ch 0.5 0.7 1.1 1.3 1.7) 4.0)
		)
	)

(fun one
	(* 
		(* (+ (list (cycle walker2) (cycle walker2) (cycle walker2))) 0.1)
		chopper))
(fun two
	(* 
		(* (+ (list (cycle walker) (cycle walker) (cycle walker))) 0.1)
		chopper))


(# tab1 (fillf 44100 0 0))

(step-pan-gen
	(write tab1 
		(+ (* one two 10) 
			(leakDC (index-lin tab1 (line (seq 0 44100) (ch 0.5 0.1 2.0 0.666667 1.5 2.5))) (st 0.99)) )

			(count (table-cap tab1))) 
	(st 1)
	(line (seq -1 1) (ch 3 5 7 0.1 0.2)))