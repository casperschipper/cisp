(# table1 (fillf 128 0 128))

(fun a
	(line
		(seq 0 128)
			(t
			(ch 0.1 1 4 7) (ch 0.1 .2 .5 1.0 2.0 5.0 6.0))))

(procedure writeCall
	(write table1 
		(count 128) 
		(+ 
			(loop (count 128) (ch 4 8 6) (ch 4 8 6))
			(line (seq 0 16) (ch 2 5 7)))))

(procedure writeCall2
	(write table1
		(rv 0 128)
		(rv 0 128)))

(schedule 
	(ch writeCall writeCall2)
	(line (seq 0.05) (ch 3 5 9)))

(fun walki (guardedWalk
		0 (
			(guardTest (< a) (+ (st 64)))
			(guardTest (> a) (- (st 64)))
			(otherwise (hold (weights ((-1 100) (1 100) (-10 1))) (ch 1 3 5))))))

(fun freq
(index OSC.table2 (index table1 walki)))

(~ output (/ 44100 (mtof freq)))


(step-gen (sineseg (~ output)) (st 1)) 