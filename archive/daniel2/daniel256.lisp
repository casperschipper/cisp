(# t1 (fillf 441000 0 0))

(fun sig
	(t 
		(seq -.1 .1)
		(st 0.001)))

(step-gen
	(write t1 
		(biquad
				(+ (list 
				(* sig (line (seq 1.0 0.0 0.0) (seq 1 100)))
				(audioIn 0)
				(* (index-lin t1 (line (seq 0 (seq 0 441000)) (/ (ch 0.6666667 1.5 0.1 2.0) 0.1))) 1.0)
				(* (index-lin t1 (line (seq 0 (ch 0 441000)) (/ (ch 0.6666667 1.5 0.1 2.0) 1))) 1.0)
				(* (index-lin t1 (line (seq 0 (ch 0 441000)) (/ (ch 0.6666667 1.5 0.1 2.0) 4))) 1.0)))
			1
			(st 50)
			(st 1)
			(st 1.0))
		 (count 44100))
	(st 1)
	)
	



