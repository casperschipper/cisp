(fun 
	low
	(line
	(hold (seq 0 64 32 256 400) (ch 2))
	(ch 0 0 0 0 0 0 0 0 0 0 0.1 0.2 0.9 1.0 2.0 4.0)))


(step-pan-gen
	(index-lin OSC.table9 
		(line
			(seq low 128)
			(t 
				(reset 
					(bounded-mup-walk 0.0001 0.01 (ch 0.5 2.0 3.0))
					(st 0.1)
					(ch 5 7 11 25))
				(ch 0.1 0.2))))
	(st 1)
	(index-lin OSC.table9 
		(line
			(seq low 128)
			(t 
				(ch 0.1 0.01 0.1 0.9 1.0 0.0001)
				(ch 0.1 0.01 0.1 0.9 1.0 0.0001)))))