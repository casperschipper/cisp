(fun stepsize2
	(t (ch (rv 1 1000) (rv 0.1 2.0) (rv 0.0001 0.0001)) (fractRandTimer (ch 0.001 0.1 0.2 0.4 0.8 1.6 3.2))))

(fun stepsize
	(t (ch (rv 1 1000.0) (rv 0.0001 0.01)) (fractRandTimer (ch 0.001 0.1 0.2 0.4 0.8 1.6 3.2))))

(step-pan-gen
	(bouncy-walk -1 1 
		(bouncy-walk (* -1 stepsize2) stepsize2
			(bouncy-walk -0.1 0.1 (ch (* -1 stepsize) stepsize) )))
	(st 1)
	(bouncy-walk -1 1 
		(bouncy-walk -0.1 0.1
			(bouncy-walk -0.1 0.1 (ch (* -1 stepsize) stepsize) ))))