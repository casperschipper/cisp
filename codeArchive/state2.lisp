
(fun bah
	(statemachine (list 
		(weights ((1 4) (0 1)))
		(weights ((2 4) (0 1)))
		(weights ((3 4) (0 1)))
		(weights ((0 4) (0 1))))))

(step-gen
	(cycle 
		(hold (mtof (+ (* 
		(index
	 (list 
	 	 (latch (list-walk OSC.table1 (weights ((1 100) (-1 2)))) (st 12800))
		 (seq (fillf 128 -1 1) true)
		 (seq (sine 12 (1.0)) true)
		 (latch (ch OSC.table1) (rv 1000 10000))
		 )
	bah) 10) 120)) (st 10)))
	(st 1))

