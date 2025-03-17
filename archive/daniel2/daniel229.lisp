(# t1 (fillf 44100 0 0))

(fun sig
	(t 
		(seq -.1 .1)
		(st 0.001)))

(step-gen
	(write t1 
		(+ (list 
			sig 
			(* (index-lin t1 (line (seq 0 (seq 0 44100)) (ch 0.6666667 1.5))) 0.33)
			(* (index-lin t1 (line (seq 0 (seq 0 44100)) (ch 0.6666667 1.5))) 0.33)
			(* (index-lin t1 (line (seq 0 (seq 0 44100)) (ch 0.6666667 1.5))) 0.33))) (count 44100))
	(st 1)
	)



