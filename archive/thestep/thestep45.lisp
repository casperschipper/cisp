//cool


(fun a
	(t 
		(bounded-walk 1 100 (ch -1 1))
		(fractRandTimer (ch 0.01 0.1 0.2 0.001))))

(step-pan-gen
	(seq -1 1)
	(bounded-walk 1 1000 (ch (* -1 a) a))
	(line (seq 0 1 1 0) (fractRandTimer (ch 0.01 0.1 0.2 0.5)))
	)
