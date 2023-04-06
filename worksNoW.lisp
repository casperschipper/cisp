(# table1 (fillf 128 0 128))

(fun a
	(line
		(seq 0 128)
			(t
			(ch 0.1 .2 .5 1 2 4 7) (ch 0.1 .2 .5 1.0 2.0 5.0 6.0))))

(procedure writeCall
	(write table1 (count 128) (rv 0 128)))

(schedule writeCall (st 0.1))

(fun walki (guardedWalk
		0 (
			(guardTest (< 0) (+ (ch 10 20)))
			(guardTest (> (ch 4 8 16 32 128)) (- (ch 20 30)))
			(otherwise (hold (ch -1 -10 20 1) (ch 1 2 3 4 5 1 2 3 4 5 1 1 1 1 1  16 32 8))))))

(fun freq
(index OSC.table2 (index table1 walki)))

(~ output (/ 44100 (mtof freq)))

(test (ch table1))

(step-gen (sineseg (~ output)) (st 1)) 