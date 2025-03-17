(fun f1
	(t
		(bounded-mup-walk (st 100) (st 1100) (ch 0.95 1.05))
		(st 0.5)))

(fun f2
	(t
		(bounded-mup-walk (st 100) (st 1100) (ch 0.95 1.05))
		(st 0.5)))


(fun f3
	(t
		(bounded-mup-walk (st 100) (st 1100) (ch 0.95 1.05))
		(st 0.5)))


(fun f4
	(t
		(bounded-mup-walk (st 100) (st 1100) (ch 0.95 1.05))
		(st 0.5)))



(fun sinusMix
	(* 0.25 (+ (list
		(cycle f1) (cycle f2) (cycle f3) (cycle f4)))))



(step-gen
	(* sinusMix sinusMix)
	(st 1)
	)