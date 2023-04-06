(# tab1
	(sine 32 (1. 0 1 0 0 0 0 1)))

(fun foo
	(line
		(seq 0 9)
		(ch 3 5)))

(fun a
	(t
	(index (10. 11 12 33   44 100 200   400 1000 1001) (rv foo foo))
	(fractRandTimer (ch 0.0002 0.001 0.1 0.05 1 0.5))))

(fun direction
	(index (0 1)
		(t
			(ch -1 1 -2 2 -4 4)
			(fractRandTimer (ch 0.001 0.1 0.2 0.5 1.0)))))

(step-pan-gen
	(list-walk tab1 direction)
	(index
		(
			(st a)
			(ch a a a)
			(rv a a)
			(ch a a a a a))
		(t (rv 0 5) (st .1)))
	(hold
		(rv -1 1)
		a)
		)