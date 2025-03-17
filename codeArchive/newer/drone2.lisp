(# tab1 (fillf 44100 0.0 0.0))

(samp-schedule
	(write tab1 (* (audioIn 0) 3) (count 44100))
	(seq (latch (st 1) (st 44100)) 1))



(fun ti
	(fractRandTimer (t 
	(bounded-mup-walk (ch 0.5 0.999 1.001 0.75 2.0) (st 0.001) (st 3.0))
	(ch 0.2 0.3 0.5 1.0 2.0 3.0)
	)
	))

(fun stepper
	(* 
		(line (seq 0 0.1) (ch 0.3 0.4 1.0))
		(line 
	(seq -1 1)
	(st 1000))))

(clone
(step-gen
	(+ (index tab1 
		(line (seq 0 44100) (seq ti 0))) stepper)
	(st 1)
	:pan (rvfi 0.0 1.0))
4)

