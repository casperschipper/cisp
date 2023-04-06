(fun weighty
	(index
		(list -1 1)
		(rv 0 (line (seq 0 2) (ch 1 3 7)))))

(fun a
	(t
		(ch 0.00003 0.00004)
		(fractRandTimer (list-walk (0.0001 0.01 0.01 0.1 0.5 1) weighty))))

(fun amp
	(guardedWalk 
		-1 
		(
			(| (> 0.999) (overwrite -1))
			(otherwise (+ (* (list-walk (99 100 105) weighty) a) ))
		)))


(step-gen
	amp
	(st 1)
	:pan (rvfi -1 1)
	) 