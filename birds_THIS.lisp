(# mups (0.5 1.0 2.0 4.0 0.667 0.5 0.25 1.0 1.5 1.25 1.4 0.8 0.6))

(# mupsnow (0.6667 1.5))

(schedule
	(write mupsnow (ch mups) (seq 0 1))
		(st 2))


(fun a
	(reset (bounded-mup-walk (st 20) (st 15000) (ch mupsnow) 8000) (ch 4000) (ch 40 50 100) ))


(# times (steno "0.0 dkjhsdlkjfheraulvhabhvhbvlaebhvuabeluvhbrvalsjehrbvlajhsbvlaevhae 100..2000"))



(fun tend
	(line 
		(seq 0 (table-cap times))
		(rv 3 7)))

(fun tim
	(index times
		(rv tend tend)))


(step-pan-gen
	(lookup OSC.table1 (* (cycle (hold a tim)) (line (seq 0 1) (ch 3 11))))
	(st 1)
	(line (seq 0 1) (fractRandTimer (ch 0.1 0.2 0.5 1.0 2.0))))
