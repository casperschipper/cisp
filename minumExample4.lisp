(# mem (list 0.))
// this is just a cell to keep last position

(fun a 
	(line 
		(seq 1 1000)
			(fractRandTimer (ch 0.001 0.2 0.3 1.0 2.0))))

// let's go!
(samp-schedule 
	(write mem 
			(index 
				(list 
					(sometimes (st 0) (rv 0 5) (st 10)) // 0
					(sometimes (rv 0 3) (st 1) (st 1000)) // 1
					(sometimes (rv 3 5) (st 1) (st 10)) // 2
					(ch 0 4) // 3
					(line (ch 0 5) (ch 0.1 0.2 1.0 7.0))) // 4
			(seq mem))
		(st 0)
		)
	(st 1))

(step-gen
	(seq OSC.table1 :max (st 55))
	(index 
		(list 1. (hold (ch 1 7 6 ) (hold (ch 1 100 2000) (ch 1 100 2000))) 3 (rv 1 100))
		(seq mem))
	:pan (rvfi -1 1))




