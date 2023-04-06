(fun a 
	(line
		(seq 0 128)
		(t (ch .1 .01 3 7 5) (seq 1 3 5 1))))

(fun b
	(t
		(ch 1 2 3 4 5 6 7) (seq 1 2 4)))


(fun freq
	(/ 44100
		(mtof
			(index OSC.table2 (line (seq a a) (fractRandTimer (* (ch 0.001 0.0001 0.01 0.1 1.0 10) b ))) ))
		))

(fun N
	(mtof
		(line 
			(ch 1 3 4 16 32)
			(fractRandTimer (ch 0.001 0.01 0.1)))))


(fun gater
	(t 
		(seq 1 0)
		(ch 1 3 5 .3)))

(step-gen
	(sineseg 
			(+
				(loop
					(index 
						(list (+ freq (* b 10)) freq freq freq freq freq) (/ a 21) ) 
				N
				N) 

				(* (line (hold (loop (ch 1 2 4 8 100 1000) N N) (ch 1 2 2 2 2 2)) (loop (ch 0.05 .1 .2 1 2) N N)) gater )   ))
		(st 1) )