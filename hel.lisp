(fun freq
	(t
		(list-walk (1 2 3 4 5 6 100 200 300 400 1000))
		(fractRandTimer (ch .001 .3 .5 1.0))))

(step-gen
	(list-walk (fillf 32 -1 1))
	(st 1))