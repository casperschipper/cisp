(fun slowOffset
	(line
		(seq -.1 .1)
		(ch 3 5)))

(fun topf
	(line
		(seq 1000 100)
		(ch 5 11)))

(fun filter (in)
	(* (biquad in 0 topf 0.707 1.0) 1))

(fun foo
	(wr m1 
		(clip 
			
			(reset (walk 0 (* (lookup OSC.table1 (rd m1)) 0.6)) (st 0) (st 88100))

		-1 1)))

(step-pan-gen
	foo
	(t 
		(floor (rv 1 10)) 
		(rv 4 8))
	(bounded-walk -1 1 (rv -0.01 0.01)))