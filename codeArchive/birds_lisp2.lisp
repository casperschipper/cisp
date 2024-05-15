(# mups (0.5 1.0 1.1 1.5 1.4 1.333333333 0.6 1.0 1.5 2.0 0.9))

(# mupsnow (0.6667 1.5))

(schedule
	(write mupsnow (ch mups) (seq 0 1))
		(st .2))


(fun a
	(reset 
		(bounded-mup-walk (st 50) (st 15000) (ch mupsnow) 8000) 
		(ch 1000 4000) (ch 50 100) ))


(# times (steno "100..1000 40000..40100"))



(fun tend
	(line 
		(seq 0 (- (table-cap times) 1))
		(rv 3 7)))

(fun tim
	(index times
		(rv tend tend)))


(step-pan-gen
	(lookup OSC.table1 (* (cycle (loop (hold a tim) (ch 1 2) (ch 2 4 8 10))) (line (seq 0.1 1) (ch 3 11))))
	(st 1)
	(line (seq 0 1) (fractRandTimer (ch 0.1 0.2 0.5 1.0 2.0))))
