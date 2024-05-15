(fun freq
	(/ 44100
	(mtof
	(line
		(seq 0 118)
		(fractRandTimer (ch 0.001 1 4 33 17))))))

(fun N
	(mtof
		(t 
			(ch 1 4 8 16)
			(fractRandTimer (ch 0.001 0.01 0.1 0.2 0.6 1.2 4.0)))))

(clone
(step-gen
	(sineseg 
			(hold
				(index 
					(list freq freq freq freq freq freq) (count 5) ) 
			N))
		(st 1) :pan (rvfi -1 1) ) 5)