(step-pan-gen
	(bouncy-walk -1 1 
		(bouncy-walk -0.1 0.1
			(bouncy-walk -0.1 0.1 (t (ch -0.1 0.1) (fractRandTimer (ch 0.001 0.1 0.2 0.4 0.5 1.0))))))
(st 1)
(bouncy-walk -1 1 
		(bouncy-walk -0.1 0.1
			(bouncy-walk -0.1 0.1 (ch -0.1 0.1)))))