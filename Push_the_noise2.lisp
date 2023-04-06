/*
This will create pulses

*/

(# table1 (fillf 32 -1 1))
(# table2 (collect (ch 1 2 3 10 100) 8))


(~ writer
	(write
		table2
		(ch 1 3 5 66 (rv 1 300)) /* will somtimes miss higher values */
		(count 8)))

(schedule
	(~ writer)
	(t
		(ch .01 .001 0.4 0.8)
		(ch .1 .4 .8 .01)))

(fun scaler
	(hold
		(seq table2)
		(seq table2)))

(fun topweight
	(t
		(mtof (ch table2))
		(/ 1 (rf -80 40))))

(fun zero
	(hold 
		(weights ((-1 100) (1 100) (0 1)))
		topweight))


(step-pan-gen 
		(seq 
		(latch (seq table1) (st 1)) 
		(latch zero
			(* (seq table2) scaler) ))
	(st 1)
	(hold 
		(seq table1)
		(ch table2)) )