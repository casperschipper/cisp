(# table1 (fillf 128 0 3))

(fun a
	(line
		(seq 0 128)
			(t
			(ch 0.1 1 4 7) (ch 0.1 .2 .5 1.0 2.0 5.0 6.0))))

(procedure writeCall
	(write table1 
		(count 128) 
		(+ 
			(loop (count 12) (ch 4 8 6) (ch 4 8 6))
			(line (seq 0 16) (ch 2 5 7)))))

(procedure writeCall2
	(write table1
		(rv 0 128)
		(rv 0 12)))

(schedule 
	(ch writeCall writeCall2)
	(line (seq 0.1 0.3) (ch 3 5 9)))

(fun walki (guardedWalk
		0 (
			(guardTest (< a) (+ (ch 64 62 63 0)))
			(guardTest (> a) (- (ch 64)))
			(otherwise (ch 1 1)))))

(fun mask 
	(line (seq a a) (fractRandTimer (ch 0.001 0.01 0.1 0.2 (line (seq 0.1 1.5) (ch 1 3 5))))))


(fun loopSize
	(t
	(ch 128)
	(ch 1 3 2)))

(fun loopAmount
	(t 
	(rv 16384 32266)
	(ch 1 3 2)))

(fun loopedWalki
	(loop walki loopSize loopAmount))

(fun loopedMask
	(loop mask loopSize loopAmount))




(fun indexSelect
	(index
		(list loopedWalki loopedMask) (t (ch 0 1) (ch 3 2 1))))

(fun freq
(index OSC.table2 (index table1 indexSelect)))


(fun quantizer
	(hold 
		(seq 4 (seq 0 5 7 12 7) 7 12 (seq 12 24 7 14) 1)
		(hold (seq 2 1 1 1 1 1 1 30 100 1) (seq 2 30 500 1))))

(fun mupper (mtor 
	(line
		(hold (rv -36 0) (ch 2 3))
		(fractRandTimer (ch 0.01 .1 0.5)  ))))

(fun output (/ 44100 (* 
	(mtof (q freq quantizer)) mupper )))




(step-gen (sineseg output) (st 1)) 