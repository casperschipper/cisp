(# tab1 (sine 128 (1.0)))

(fun a 
	(line
	(ch 10)
	(st 0.1)))

(step-gen
	(index-lin tab1 (line (seq 0 44100) 
		(* 0.09 
			(line 
				(seq 0.01 0.2 0.3 0.4 1.0)
				(seq 0.1)))))
	(st 1))