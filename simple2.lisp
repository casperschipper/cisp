(fun stepper
	(t
	(seq 0.01 .1 .2 .3 1 22 333 26343)
	(fractRandTimer (ch 0.01 1 8))))
/* TODO TABLEINDEXLIN listwalk lin! */
(fun freq
(index
	(list
	(list-walk-lin OSC.table1 stepper)
	(list-walk-lin OSC.table2 stepper)
	(list-walk-lin OSC.table3 stepper)
	(list-walk-lin OSC.table4 stepper)
	)
	(t (rv 0 4) (fractRandTimer (ch 0.01 0.1 1 2 4)))))

(fun mupper
	(t
		(ch (rv 0 1) 0.5 1 2 4 88 100 20 30 872364872364 0.33333)
		(ch 0.01 0.1 0.2 0.8 2 4 8)))

(fun timeStep
	(ch
		(tLatch (st 1) (ch 0.01 .1 .2 4))
		(tLatch (rv 1 10) (ch .1 .2)
			)))

(clone
(step-gen
	(index
	(list
	(list-walk-lin OSC.table1 (* (+ freq 1) mupper))
	(list-walk-lin OSC.table2 (* (+ freq 1) mupper))
	(list-walk-lin OSC.table3 (* (+ freq 1) mupper))
	(list-walk-lin OSC.table4 (* (+ freq 1) mupper))
	)
	(t (rv 0 4) (fractRandTimer (ch 0.01 0.1 1 2)))
	)
	timeStep
	:pan (rvfi -1 1))
3)