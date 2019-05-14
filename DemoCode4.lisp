(# table1 (fillf 32 -1 1))
(# table2 (collect (ch 1 2 3 10 100) 8))


(~ writer
	(write
		table2
		(ch 1 2 3 (rv 1 100))
		(count 8)))

(schedule
	(~ writer)
	(t
		(ch .01 .1 .4 .8 .2)
		(ch .1 .4 .8 .01)))

(fun scaler
	(hold
		(seq table2)
		(seq table2)))

(step-pan-gen
	(seq 
		(latch (seq table1) (st 1)) 
		(latch (st 0) 
			(* (seq table2) scaler) ))
	(st 1)
	(hold 
		(seq table1)
		(seq table2)))