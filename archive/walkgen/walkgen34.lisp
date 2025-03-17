(# mem1 (fillf 44100 0.0 0.0))

(step-pan-gen
	(write mem1 
		(tanh (biquad 
			(+ 
				(index-lin mem1 
					(+ 
						(line (seq 0 44100) (ch 0.1 0.3 1.0 2.0 0.001 0.002))
						(line (seq 0 441) 
							(hold (ch 0.02 0.03 0.04 0.00024 0.001 0.002) (ch 4 8 15 200)))))
				(* (hold (seq -.25 .25) (rv 1 10)) (line (seq 0 1 1 0) (seq (ch 0.01 0.1) (ch 0.1 0.4) (ch 0.01) (ch 0.1 0.4 0.5 1.0 2.0 4.0 8.0 10.0))))
			)
			1
			20
			0.9 
			0.5))
		(count (table-cap mem1)))
	(st 1.0)
	(t (seq (fillf 32 -1 1)) (fractRandTimer (ch 0.01 0.1 0.2 0.3 0.5 1.0 2.0)))
)