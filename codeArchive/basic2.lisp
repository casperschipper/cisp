(fun b
	(t 
		(ch 1 2 3 4 5 1000 12 15 160)
		(seq 0.1 0.5 1)))


(samp-schedule
	(write 
		OSC.table1
		(line
			(seq -1 1)
			(ch 0.001 0.03 0.1))
		(count 128))
	(line (seq 1 100) (ch 0.1 0.5 1.0)))

(fun a 
	(t 
		(seq 1 2 (sometimes (rv 1 100) (st 1) 100) 4 5)
		(ch .1 .2 .4 .6)))



(clone
	(step-gen
	(* (list-walk OSC.table1 (ch -1 1)) 0.5)
	(st 1)
	:pan (rvfi -1 1)
	)
	
	3)
