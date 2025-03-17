(# table1 (fillf 44100 0 0))

(fun sqrsig
	(* 
		(line (seq 0 0.1 0.1 0) (seq 0.01 4.0 0.01 100.0))
		(hold (seq -1 1) (st 100))))



(step-gen
	
	(write 
		table1
		(+ 
			(list 
				(seq table1) 
				(* 0.1 (index table1 (line (seq 0 44100) (ch 0.01 0.001 2.0 4.0 8.0 0.5 1.5 1.0))))
					sqrsig))
				(count (table-cap table1)))

	(st 1))