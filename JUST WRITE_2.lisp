(fun a 
	(loop
	(line
		(ch 0 30 60 128)
		(t (ch 1 5 7 11 13) (seq 1 3 5 1)))
	(st 32)
	(st 4)))

(fun b
	(t
		(ch 1 2 3 4 5 6 7) (seq 1 2 4)))


(fun freq
	(/ 44100
		(mtof
			(index OSC.table2 (line (seq a a) (fractRandTimer (* (ch 0.001 0.02 0.03 0.5) b ))) ))
		))

(fun N
	(mtof
		(line 
			(ch 1 2 3 5 7 10 20 40)
			(fractRandTimer (ch 0.001 0.01 0.1)))))


(fun gater
	(t 
		(seq 1 0)
		(ch 1 3 5 .3)))


(~ out
	(clip 
		(+
					(loop
						(index 
							(list (+ freq (* b 10)) freq freq freq freq freq) (/ a 21) ) 
					N
					N) 

					(* (line (hold (loop (ch 1 2 4 8 100 1000) N N) (ch 1 2 2 2 2 2)) (loop (ch 0.05 .1 .2 1 2) N N)) gater )   ) 0.0001 2250 )

					)




(step-gen
	(sineseg (~ out))
	(st 1))

				