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
		(seq 44100 0)
		(st 6)))

(step-gen (write mem1 
			(bounded-walk (st -1) (st 1)
				(bounded-walk (st -1) (st 1) 
					(bounded-walk (st -1) (st 1) 
						(* -0.01 
							(+ (lookup 
								(index mem1 (st 0))) (* diff (delay  (index mem1 (st 0)) 44100 delaytime))	 
							)
						))))
			(st 0))
(st 1)
:pan (rvfi -1 1)
)