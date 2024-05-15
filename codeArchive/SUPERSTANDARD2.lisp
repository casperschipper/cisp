(fun 
	low
	(line
	(hold (seq 0 64 32 256 400) (ch 2))
	(ch 0.1 0.2 0.9 1.0 2.0 4.0)))


(step-pan-gen
	(index-lin OSC.table9 
		(line
			(seq 0 512)
			(t
				(reset 
					(bounded-mup-walk 0.001 0.1 (seq 0.75 0.6667 1.5 1.25 0.5 0.4 0.3))
					(ch 0.0005 0.01 0.002 0.03)
					(ch 5 7 11 25))
				(ch 2 5))))
	(st 1)
	(index-lin OSC.table9 
		(line
			(seq low 128)
			(t 
				(ch 0.1 0.01 0.1 0.9 1.0 0.0001)
				(ch 0.1 0.01 0.1 0.9 1.0 0.0001)))))