(fun tt (arg)
	(t arg (ch 0.01 0.1 0.2 0.8)))

(fun a 
	(line 
		(seq 0 9)
		(index (.1 .10 .2 .3 .4 .05 6 7)
		(rv 0 7))))

(fun b
	(index (1 (line (seq 1 3) (ch .1 .2 .3)) 1 (tt (rv 1 33)) 44 7 55 11 (tt (ch 3033 20 17 42 65 333 11)))
		(rv a a)))

(fun pitch
	(index (list b b b b b b)
		(rv a a)))

(fun pn
	(index (list -1. -.5 -.1 0 .1 .5 1)
		(rv a a)))

(step-pan-gen 
	(seq (fillf 8 -1 1))
	pitch
	(t pn (fractRandTimer (ch 0.001 0.1 0.2 0.4 1.0 0.1))))