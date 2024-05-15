(fun updateS
	(t
		(rv 1 128)
		(fractRandTimer (ch 0.001 0.1 0.2 0.5 1.0))))

(samp-schedule
	(write OSC.table3 (sometimes (rv -1 1) (st 0) updateS) (count updateS))
	(seq updateS updateS updateS))

(clone
(step-pan-gen
	(seq OSC.table3)
	(seq (/ updateS 10) (/ updateS 10) (/ updateS 10))
	(seq OSC.table3)) 3)

