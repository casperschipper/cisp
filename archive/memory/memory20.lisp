(# table1 (fillf 44100 0 0))

(fun sqrsig
	(* 
		(line (seq 0 0.9 0.1 0) (seq 0.01 4.0 0.01 (rv 0 3)))
		(hold (seq -1 1) (st 100))))



(step-gen
	
	(write 
		table1
			(biquad 
				(+ 
					(list 
						(* (seq table1) 0.1)
						(* 0.9 (index table1 (line (seq 0 44100) (ch 1.618033988749 (/ 1.0 1.618033988749)))))
							sqrsig
					)
				)
			1
			(st 100)
			(st 0.9)
			(st 1.0))
		(count (table-cap table1)))
	(st 1)
	:pan (rvfi -1 1))