(# table1 (fillf 128 0 128))

(fun a
	(line
		(seq 0 128)
			(t
			(ch 0.1 1 4 7) (ch .5 1.0 2.0 5.0 6.0))))

(procedure writeCall
	(write table1 
		(count 128) 
		(+ 
			(loop (count 128) (ch 4 8 6) (ch 4 8 6))
			(line (seq 0 128) (ch 2 5 7)))))

(procedure writeCall2
	(write table1
		(rv 0 128)
		(rv 0 128)))

(schedule 
	(ch writeCall writeCall2)
	(line (seq 0.1 0.3) (ch 3 5 9)))

(fun walki (guardedWalk
		0 (
			(guardTest (< 128) (+ (ch 126)))
			(guardTest (> 0) (- (ch 126)))
			(guard (hold (ch 1 1) (st 10))))))

(fun mask 
	(line (seq a a) (fractRandTimer (ch 0.1 0.2 (line (seq 0.1 1.5) (ch 1 3 5))))))


(fun loopSize
	(t
	(ch 1)
	(ch 1 3 2)))

(fun loopAmount
	(t 
	(rv 1000 2000)
	(ch 1 3 2)))

(fun loopedWalki
	(loop walki loopSize loopAmount))

(fun loopedMask
	(loop mask loopSize loopAmount))




(fun indexSelect
	(index
		(list loopedWalki loopedMask) (t (ch 1 1) (ch 3 2 1))))

(fun freq
(t (index OSC.table2 (index table1 indexSelect)) 0.2))


(fun quantizer
	(hold 
		(seq 4 (seq 0 5 7 12 7) 7 12 (seq 12 24 7 14) 1)
		(hold (seq 30 100 200) (seq 2 30 500 1))))

(fun mupper (mtor 
	(line
		(hold (seq 0 0) (ch 2 3))
		(fractRandTimer (ch 0.01 .1 0.5 2.0 4.0)  ))))

(fun output (/ 44100 (* 
	(mtof (q freq quantizer)) mupper )))




(step-gen (* (sineseg output) 1) (st 1)) 