(fun a 
	(line
		(seq 0 128)
		(ch 3 7 5)))

(fun b
	(t
		(rv 1 10) (st 4)))


(fun freq
	(/ 4410
		(mtof
			(index OSC.table2 (line (seq a a) (fractRandTimer (* (ch 0.001 0.0001 0.01 0.1 1.0 10) b ))) ))
		))

(fun N
	(mtof
		(line 
			(ch 1 3 4 16 32)
			(fractRandTimer (ch 0.001 0.01 0.1)))))


(clone
(step-gen
	(sineseg 
			(+
				(loop
					(index 
						(list freq freq freq freq freq freq) (/ a 8) ) 
				N
				N) (line (loop (ch 1 2 4 8 100) N N) (loop (ch 0.05 .1 .2 1 2) N N))))
		(st 1) ) 1)