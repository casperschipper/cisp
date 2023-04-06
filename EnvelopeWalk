(fun imp
	(hold
		(seq 1 0)
		(seq 1 20000)))

(fun aa
	(guardedWalk 1
		(
			(|= (< 0.001) (st 1))
			(| (< 1.1) (* 0.999)))))

(step-gen
	(* aa (rv -1 1))
	(st 1))