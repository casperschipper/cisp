(fun freq 
	(bounded-mup-walk (st 20) (st 20000) (ch 2 0.5 1.0 1.5 1.6667 0.6667)200))

(fun timer
	(fractRandTimer (/ 1 (rf -40 130))))

(fun freqs
	(index (list freq freq freq freq) (hold (bounded-walk 0 4 (ch -1 1)) (rv 5 15) ) ))

(step-gen
	(cycle (t (/ 44100 freqs) timer))
	(st 1))