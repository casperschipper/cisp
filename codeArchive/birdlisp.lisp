
(fun bah
	(statemachine (list 
		(weights ((1 2) (0 10)))
		(weights ((2 2) (0 1)))
		(weights ((3 2) (0 1)))
		(weights ((0 1) (0 1))))))

(step-gen
	(cycle 
		(hold (mtof (+ (* 
		(index
	 (list 
	 	 (latch (list-walk OSC.table1 (weights ((1 1000) (0 10000) (-1 20000)))) (rv 0 10))
		 (seq (fillf 128 -1 1) true)
		 (seq (sine 12 (1.0)) true)
		 (latch (ch OSC.table1) (rv 1 100))
		 )
	bah) 128) 30)) (ch 1 2 3 4 10)))
	(st 1))

