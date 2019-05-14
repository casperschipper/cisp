(# history (collect (hzPhasor (st 100)) 44100))

(fun stepper
		(index 
			(
				(rv -1 1)
				(hold (rv -10 10) (ch (grow 1 2 15)))
				) 
			(t 
				(weights ((0 10) (1 100)))
				(ch (grow 0.1 2 8)))
		))

(clone
(step-gen
	(* (list-walk history stepper) 0.5)
	(st 1.0)
	:pan (rvfi -1 1))
3)