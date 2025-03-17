(# tab (fillf 32 -1 1))

(fun top 
	(line
		(seq 10 1000)
		(fractRandTimer (ch 0.001 0.1 0.2 0.1 0.5 1.0 2.0))))

(samp-schedule
	(write tab (sin (line (seq 0 2000) (rv 100 100))) (count 32))
	(rv (st 1) top))


(step-gen
	(index-lin tab (line (seq 0 32) (/ 1.0 350)))
	(st 1))