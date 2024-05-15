(# wavetab1
	(fillf 512 -0.1 0.1))


(fun top
	(line
		(seq 1 2000)
		(ch 1 2 3 5 6))
	)

(~ writer
	(write wavetab1 (bounded-walk -0.5 0.5 (hold (reset (walk 0 (ch -0.1 0.1)) (st 0) top) (rv 1 2))) (count 512)))


(samp-schedule 
	(~ writer)
	(rv top top))


(fun ratio
	(t
		(reset (mup-walk 4.0 (ch 1.25 0.6666667 1.5 0.75 0.999)) (st 1.0) (st 300))
		(fractRandTimer (ch (rv 0.001 0.1) 1 4 11 16))))

(clone
(step-pan-gen 
	(index-lin wavetab1 (walk 0 ratio))
	(st 1)
	(st (rvfi -1 1))
	)
1)

