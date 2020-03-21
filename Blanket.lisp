(step-gen
	(guardedWalk 
		-1 
		(
			(| (> 1) (overwrite -1))
			(| (< 1) (+ (list-walk (0 0 0 0.01 0.0001 0.002) (ch -1 1))))
		))
	(st 1)
	)