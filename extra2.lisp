(# tab1 (fillf 1 0 0))

(# si (sine 256 (1.0)))


(clone
(step-gen
	(index si
		(lowpass
			(* (osc-in 5321 "two" 1)
				(write tab1 
					(bounded-walk 0 2048
						(bounded-walk (* -1 (osc-in 5321 "one" 1)) (osc-in 5321 "one" 1)
							(index OSC.table9 (seq tab1))))
				(count (length tab1))))
		(osc-in 5321 "freq") (osc-in))
	)

		
	
	(st 1)
	:pan (rvfi -1. 1.))
5)





