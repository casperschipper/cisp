(fun b
	(line (seq 0 8) (ch 3 4 5)))

(fun a 
	(t 
	(index (1 2 3 4 5 6 7 8) (rv b b))
	(fractRandTimer (ch 0.5 1.0 1.5 0.3333))
	))

(fun dur
	(index (0.5 0.2 0.04) (rv b b))
	)

(fun detune
	(line
		(seq 1.0 1.5)
		(st 38)))

(sci2
	simple
	(st 0.003)
	:freq (* (* (st 1000) (/ a a)) (reset (mup-walk 1.0 (rv 0 2)) (st 1.0) (rv 16 32)))
	:dur dur
	:pos (line (seq -1 1) (* (/ a a) 1.0))
	)