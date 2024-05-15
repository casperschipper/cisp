(# tab1 (fillf 32 -1 1))

(fun a 
	(line (seq 0 32)
		(ch 0.1 0.2 0.3 10 4.0 5.0)))

(step-gen 
	(index tab1 (walk 0 
		(line 
			(seq (ch -1 2 3 -1)) 
			(hold (ch 0.001 0.2 0.3 0.4 0.5) a))))
	(st 1))

(t 
	(generator)
	(timing))