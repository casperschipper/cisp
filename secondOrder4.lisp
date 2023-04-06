(# mem1 (-3.0))

(fun lookup (arg)
	(index
		OSC.table1
		(* (+ arg 1) 128)))

(fun diff
	(line
		(seq 0.01 0.010000001)
		(st 10)))

(fun delaytime
	(line
		(rv 1 44100)
		(ch 0.1 0.3 .5 1 5)))

(step-gen (write mem1 
			(+ 
				(bounded-walk (st -1) (st 1)
				(bounded-walk (st -0.3) (st 0.3) 
					(bounded-walk (st -0.3) (st 0.3) 
						(* -0.3 
							(lookup 
								(delay (index mem1 (st 0)) 44100 delaytime)
							)
						)))) (* (delay (index mem1 (st 0)) 44100 delaytime) 0.5 ))
			(st 0))
(st 1)
:pan (rvfi -1 1)
)