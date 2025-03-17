
(fun a
	(t 
		(bounded-walk 0 100 (ch -1 1))
		(fractRandTimer (ch 0.01 0.1 0.2 0.5 1.0 1.5 2.0))))

(step-gen
	(seq -1 1)
	(bounded-walk 0 100 (ch (* -1 a) a)))
