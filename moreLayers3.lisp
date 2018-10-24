(# table1 (fillf 128 0 128))

(fun a
	(line
		(seq 0 128)
			(t
			(ch 0.1 .2 .5 1 2 4 7) (ch 0.1 .2 .5 1.0 2.0 5.0 6.0))))

(procedure writeCall
	(write table1 (count 128) (rv 0 128)))

(schedule writeCall (st 0.1))

(fun freq
(index OSC.table2 (index table1 (+ (count (rv 0 128)) (rv 0 (* a 0.05))))))

(~ output (/ 44100 (mtof freq)))

(test (ch table1))

(step-gen (sineseg (~ output)) (st 1)) 