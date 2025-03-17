(fun a 
	(line
	(seq -30 120)
	(ch .1 .2 .3 .5 3)))

(clone
(step-gen
	(index-lin (fillf 12 -1 1) (line (seq 0 32) (fractRandTimer (/ 1.0 
		(loop (rf a 142) (st 4) (st 4))))))
	(st 1)
	:pan (rvfi -1 1))
10)