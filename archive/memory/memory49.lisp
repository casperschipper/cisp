(# table1 (fillf 44100 0 0))

(fun sqrsig
	(* 
		(line (seq 0 0.9 0.1 0) (seq 0.01 4.0 0.01 (ch 5 7)))
		(hold (seq -.1 .1) 
			(reset 
				(mup-walk 100 (ch 0.5 1.0))
				(st 100)
				(rv 5 1100)))))


(fun zeroctrl 
	(index   
			(list 
				(st 0)
				(line (seq 0 44100) (ch 0.1 0.4 1.0 2.0 3.0))
				(rv 0 44100))
		(t 
			(ch 0 1 2)
			(ch 3 5 7 11))))

(step-gen
	(write 
		table1
			(biquad 
				(+ 
					(list 
						(* (seq table1) 0.1)
						(* 0.9 (index table1 (line (seq zeroctrl 44100) (* (ch 0.997 1.001 0.9999 2 0.5 0.66666667 1.5) 10))))
							sqrsig
					)
				)
			1
			(st 10)
			(st 0.9)
			(st 1.0))
		(count (table-cap table1)))
	(st 1)
	:pan 0.5)