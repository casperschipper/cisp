(fun a
	(line
		(seq (line (seq 0 128) (ch 0.001 .3 7)) 128)
		(fractRandTimer (ch 0.0004 0.001 0.1 0.2 0.001 0.5 1 2))))

(step-pan-gen
	(cycle (index 
		(fillf 128 10 20000)
		a))
	(st 1)
	(t 
		(cycle (index 
		(fillf 16 0.1 3)
		a)) (fractRandTimer (line (seq 0.0001 0.5) (rv 0 1)))))