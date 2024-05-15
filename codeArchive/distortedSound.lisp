(fun c 
	(line
		(seq 0 9)
		(ch 3 5 9)))

(fun b
	(index
		(0.001 0.1 0.2    0.5 1.0 1.2   1.0 2.5 3.0)
	(rv c c)))

(fun a
	(line
		(seq 1 10000)
		(fractRandTimer b)))

(step-pan-gen
	(seq (fillf 32 -1 1))
	(* (normalize a a a a) 50)
	(seq (fillf 32 -1 1)))