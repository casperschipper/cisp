(fun timer
	(fractRandTimer (ch 0.003 0.01 0.001 0.1)))

(fun freq
	(t 
		(loop
			(bounded-mup-walk (st 20) (st 20000) (ch 0.5 1.5 0.6667 1.75) 200)
			(rv 4 8)
			(rv 4 15))
		timer))

(fun amp
	(cycle freq))

(step-pan-gen 
amp
(st 1)
(line (seq 0 1) (rv 1 10)))