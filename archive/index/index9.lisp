(step-gen
	(index-lin (fillf 32 -1 1) (line (seq 0 32) (fractRandTimer (/ 1.0 
		(loop (rf -40 128) (st 4) (st 4))))))
	(st 1))