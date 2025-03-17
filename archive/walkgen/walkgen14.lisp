(# mem1 (fillf 44100 0.0 0.0))

(step-gen
	(write mem1 
		(tanh (biquad 
			(+ 
				(index-lin mem1 (line (seq 0 44100) (ch 0.1 0.3 1.0 2.0)))
				(hold (seq -.25 .25) (st 100))
			)
			1
			100
			0.9 
			1.0))
		(count (table-cap mem1)))
	(st 1.0)
)