(# tab1 (fillf 100 0 0))

(# si (sine 512 (1.0)))


(clone
(step-gen
	(index si
		(* (osc-in "two" 1.5)
				(write tab1 
					(bounded-walk 0 2048
						(bounded-walk (* -1 (osc-in "one" 40.0)) (osc-in "one" 40.0)
								(index OSC.table9 (ch tab1))))
				(count (length tab1))))
		
	)

	(st 1)
	:pan (rvfi -1. 1.))
3)





