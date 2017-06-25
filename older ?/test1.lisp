(fun bnd
	(t
		(rv 1 10)
		(ch .1 .2 .8 1.6 5)))

(fun foo
	(index (
		(seq (sine 16 (list 1.0)))
		(ch 1 10)
		(rv 1 200)
		(ch 100 1)
		3 4 bnd 1 bnd 1 bnd 2 1
		) (rv bnd bnd)))

(fun repeats 
	(index 
		(1 1 1 1 1 1 1 1 1 1 (ch 1 2 4 8 16 32))
		(rv 0 11)))

(fun octaver 
	(t
		(ch 0.5 0.25 0.125 0.06125 2)
		(fractRandTimer 0.0001)))
(clone
(step-gen
	(seq 
		(collect 
			(index 
				(
					(walk 0 (ch -0.1 0.1)) 
					(hold (ch -1 1) (rv 1 10))
					(seq (sine 128 (list 1.0 -1.0 2.0 1.0 0.5 1.0)))
				) 
			(hold (rv 0 3) (ch 16 8 2 32))
			)
		128
		)
	)
	(loop 
		(* (index ((rv 1 3) 2 3 4 foo 6 (ch 1 4) 8 4 10) (rv bnd bnd)) octaver)
		repeats (ch 1 2 4 8 16 32 128)
		) ) 3)


