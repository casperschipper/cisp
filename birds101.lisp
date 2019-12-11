(# mups (0.5 1.0 2.0 4.0 0.667 0.5 0.25 1.0 1.5 1.25 1.4 0.8 0.6))

(# mupsnow (0.6667 1.5))

(schedule
	(write mupsnow (ch mups) (seq 0 1))
		(st 2))


(fun a
	(reset (bounded-mup-walk (st 50) (st 15000) (ch mupsnow) 8000) (ch 4000) (ch 40 50 100) ))


(# times (1.0 2 3 4 5 10 20 40 50 100))


(fun tend
	(line 
		(seq 0 (- (table-cap times) 1))
		(rv 3 7)))

(fun tim
	(index times
		(rv tend tend)))

(fun filt (arg)
	(* (biquad arg 0 (* (avg (freqCount arg) 4) 10) 1.0 1.0) 40))

(fun mupper (arg)
	(* (lookup OSC.table3 arg) (filt (rv -1 1) ) ))

(step-pan-gen
	
	(* (wr sig 
		(lookup OSC.table1 (* (cycle (hold a tim)) 1))) (+ (mupper (rd sig)) 1))
	
	(st 1)
	(line (seq 0 1) (fractRandTimer (ch 0.1 0.2 0.5 1.0 2.0))))
