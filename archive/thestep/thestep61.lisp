//cool


(fun a
	(t 
		(bounded-walk 1 100 (ch -1 1))
		(fractRandTimer (ch 0.01 0.1 0.2 0.001))))

(fun b
	(bounded-walk -1.0 1.0 (ch -0.001 0.001)))

(fun c
	(t 
		(ch 3 10 30 40 1000)
		(fractRandTimer (ch 0.01 0.1 0.2 0.3))))

(step-pan-gen
	(seq b b b b)
	(bounded-walk (st 1) c (ch (* -1 a) a))
	(line (seq 0 (rv 0 1)) (fractRandTimer (ch 0.01 0.1 0.2 0.5)))
	)
