(~ lower
	(t 
		(rv 1 10)
		(ch 0.1 0.2 1 4))
	)



(clone
(step-pan-gen 
(loop (seq OSC.table1) (weights ((2 100) (8 1000) (16 1) (16384 1))) (weights ((2 100) (8 1) (16 1))))
(hold (ch 1 2 3 30 (~ lower)) (ch (grow 1 2 10)))
(t (loop (rv -1 1) (weights ((2 100) (8 1000) (16 1) (16384 1))) (weights ((2 100) (8 1) (16 1))))
	(fractRandTimer 0.0001)))
6)

(~ casper
	(write
		OSC.table1
	(hold (rv -1 1) (index (collect (rv 0 128) 128) (rv 0 (line (seq 0 128) (ch 10 3)))))
	(count 128)
	))

(schedule
	(~ casper)
	(st 0.0001))