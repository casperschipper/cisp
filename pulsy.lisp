(# tab1
	(fillf 32 -1 1))

(fun foo
	(line
		(seq 0 9)
		(ch 3 5)))

(fun a
	(t
	(index (1. 2 4 3 5 7 11) (rv foo foo))
	(fractRandTimer (ch 0.0002 0.001 0.1 0.05 1 0.5))))


(step-gen
	(seq tab1)
	(index
		(
			(st a)
			(ch a a a)
			(rv a a)
			(ch a a a a a))
		(t (rv 0 5) (st .1))
		))