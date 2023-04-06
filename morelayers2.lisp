(fun a
	(line
		(seq 0 128)
			(t
			(ch 0.1 .2 .5 1 2 4 7) (ch 0.1 .2 .5 1.0 2.0 5.0 6.0))))

(~ writeCall
	(write OSC.table1
		(line (seq a a) (fractRandTimer (ch 0.001 0.01 0.1 0.5 1.0 4.0 8.0))) (count 128)  ))

(schedule
	(~ writeCall)
	(st 0.1))

(fun freq
(index OSC.table2 (index OSC.table1 (+ (count2 5) (rv 0 128) ))))

(~ output (/ 44100 (mtof freq)))

(step-gen
(sineseg (~ output)) (st 1))