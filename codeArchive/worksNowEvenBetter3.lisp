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
	(line (seq a a) (fractRandTimer (ch 0.01 0.001 (line (seq 0.1 1.5) (ch 1 3 5))))))

(~ indexSelect
	(index
		(list mask mask) (t (ch 0 1) (ch .1 .5 3 12))))

(fun freq
(index OSC.table2 (index table1 (~ indexSelect))))

(fun loopSize
	(t
	(seq 1 1 2 3 )
	(st 10)))

(fun loopAmount
	(t 
	(seq 1 1 1 1)
	(st 10)))

(~ output (/ 44100 (loop (mtof freq) loopSize loopAmount)))


(step-gen (sineseg (~ output)) (st 1)) 