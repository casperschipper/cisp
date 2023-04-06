(fun freq
	(/ 1
	(mtof
	(line
		(seq -100 20)
		(fractRandTimer (ch 0.001 .1 .2 .4 4 8 100))))))

(fun N
	(mtof
		(t 
			(rv 0 100)
			(fractRandTimer (ch 0.001 0.01 0.1 0.2 0.6 1.2 4.0)))))

(step-gen
	(sineseg 
			(hold
				(index 
					(list freq freq freq freq freq freq) (count 5) ) 
			N))
		(st 1) )