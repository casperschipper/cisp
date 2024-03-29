(# tab1
	(1. 2 3 4 5 6 7 11 12 100 99 120 222 43 2 2 444 33 55 6))

(fun r
	(t
		(ch 0.01 0.0001 .1 .2 .3 1 10)
		(ch 0.01 0.1 1 2 4)))

(fun a
	(t 
		(seq 0 (table-cap tab1))
		(seq r r r r r)))

(clone
(pulse-fb-synth
	(index
		(
			(seq (sine 8 (1.0)))
			(seq (fillf 32 -1 1))
			(rv -1 1)
			(seq -1 1)
			)
		(t
			(rv 0 4)
			(ch .1 .2 .5 2 3 10)))
	(index
		tab1
		(line (seq a a) r))
	(hold 
		(seq (fillf 100 -1 1)) 
		(t (ch tab1) r))
	(t
		(mtof (rv -10 120))
		(fractRandTimer (ch 0.001 0.1 0.0001 0.01 0.2)))
	(ch -1. 1 4 -4 -0.1 0.1))

1)