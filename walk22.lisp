(# tab1 (fillf 1 0 0))




(step-gen
(* 0.01 (write tab1 
	(bounded-walk 0 1024 
		(bounded-walk 0 2048 
			(index OSC.table9 (+ (t 
				(rv 0.0 (index OSC.table2 (st 0)))
				(rv 1 3)) (seq tab1)))))
	(st 0)))
(st 1)
:pan -1.)

(step-gen
(* 0.01 (write tab1 
	(bounded-walk 0 1024
		(bounded-walk 0 1024 
			(index OSC.table9 (+ (t 
				(rv 0.0 (index OSC.table2 (st 0)))
				(rv 1 3)) (seq tab1)))))
	(st 0)))
(st 1)
:pan -0.0)

(step-gen
(* 0.01 (write tab1 
	(bounded-walk 0 1024
		(bounded-walk (st 0) (* 1024 (list-walk OSC.table9 (ch -1 1)))
			(index OSC.table9 (+ (t 
				(rv 0.0 (index OSC.table2 (st 0)))
				(rv 1 3)) (seq tab1)))))
	(st 0)))
(st 1)
:pan 1.0)

(step-gen
(* 0.01 (write tab1 
	(bounded-walk 0 1024
		(bounded-walk (st 0) (* 1024 (list-walk OSC.table9 (ch -1 1)))
			(index OSC.table9 (+ (t 
				(rv 0.0 (index OSC.table2 (st 0)))
				(rv 1 3)) (seq tab1)))))
	(st 0)))
(st 1)
:pan -0.5)