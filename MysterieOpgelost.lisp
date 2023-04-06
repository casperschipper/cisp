(fun a 
	(line
		(seq 0 128)
		(ch 3 7 5)))

(fun b
	(t
		(rv 1 10) (st 4)))


(fun freq
	(/ 2200
		(mtof
			(index OSC.table2 (line (seq a a) (fractRandTimer (* (ch 0.001 0.0001 0.01 0.1 1.0 10) b ))) ))
		))

(fun N
	(mtof
		(line 
			(ch 1 3 4 10 20 30)
			(fractRandTimer (ch 0.001 0.01 0.1)))))

(step-gen
	(sineseg 
			(loop
				(index 
					(list freq freq freq freq freq freq) (/ a 8) ) 
			N
			N))
		(st 1))