(# history (collect (hzPhasor (st 100)) 441000))

(fun stepper
		(index 
			(
				(rv -1 1)
				(hold (* (ch -1 1) (ch 2 3)) (ch (grow 1 2 15)))
				) 
			(t 
				(weights ((0 50) (1 100)))
				(ch (grow 0.1 2 8)))
		))




(step-gen
	(write history
	(* (list-walk history stepper) 1.0) (count 441000))
	(st 1))

(clone
(step-gen
	(* (list-walk history stepper) 1)
	(st 1.0)
	:pan (rvfi -1 1))
4)