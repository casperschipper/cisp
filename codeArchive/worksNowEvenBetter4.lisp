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
	(line (seq 0.1) (ch 3 5 9)))

(fun walki (guardedWalk
		0 (
			(guardTest (< a) (+ (ch 32 40 50)))
			(guardTest (> a) (- (ch 1 4 50 )))
			(otherwise (hold (weights ((-1 100) (1 100) (-10 1))) (ch 1 3 5))))))

(fun mask 
	(line (seq a a) (fractRandTimer (ch 0.001 0.01 0.1 0.2 (line (seq 0.1 1.5) (ch 1 3 5))))))

(~ indexSelect
	(index
		(list mask walki) (t (ch 0 1) (ch .1 .5 3 12))))

(fun freq
(index OSC.table2 (index table1 (~ indexSelect))))

(fun loopSize
	(t
	(seq 10 50 100)
	(ch 1 3 2)))

(fun loopAmount
	(t 
	(seq 1000 200 10)
	(ch 1 3 2)))

(fun quantizer
	(hold 
		(seq 3 (seq 0 5 7 12 7) 7 12 (seq 12 24 7 14) 1)
		(hold (seq 2 1 1 1 1 1 1 30 100 1) (seq 2 30 500 1))))

(~ output (/ 44100 (loop (mtof (q freq quantizer)) loopSize loopAmount)))


(step-gen (sineseg (~ output)) (st 1)) 