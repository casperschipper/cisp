(fun a 
	(line
		(seq 0 128)
		(ch 3 7 5)))


(fun freq
	(/ 2200
		(mtof
			(index OSC.table2 (rv a a)))
		))

(fun N
	(mtof
		(t 
			(ch 0 1 2 4 8 10)
			(fractRandTimer (ch 0.001 0.01 0.1)))))

(fun countTimer
	(t
		(ch 0.001 0.01 0.1 0.2 1.0 2.0)
		(ch 0.1 0.2 1.0 2. 4 8)))

(clone
(step-gen
	(sineseg 
			(hold
				(index 
					(list freq freq freq freq freq freq) (/ a 8) ) 
			N))
		(st 1) :pan (rvfi -1 1) ) 6)