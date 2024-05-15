(fun updateS
	(t
		(rv 1 128)
		(fractRandTimer (ch 0.01 0.1 0.5 2.0 3.0))))

(samp-schedule
	(write OSC.table3 (sometimes (rv -1 1) (st 0) updateS) (count updateS))
	(seq updateS updateS updateS))

(clone
(step-pan-gen
	(seq OSC.table3)
	(seq (/ updateS updateS) (/ updateS updateS) (/ updateS updateS))
	(seq OSC.table3)) 1)

