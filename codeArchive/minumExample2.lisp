(# mem (list 0.))
// this is just a cell to keep last position

(fun a 
	(line 
		(seq 1 100)
			(fractRandTimer (ch 0.001 0.2 0.3 1.0 2.0))))

// let's go!
(samp-schedule 
	(write mem 
			(index 
				(list 
					(sometimes (rv 0 5) (st 1) (st 1000))
					(hold (ch 0 1) (rv 1 10000))
					(hold (rv 0 5) (rv 1 10000))
					(st 2)
					(hold (seq 0 1 2 3 4) (rv 1 1000)))
			(seq mem))
		(st 0)
		)
	(st 1))

(step-gen
	(seq -1. 1)
	(index 
		(list 1. 2 300 a)
		(seq mem))
	:pan (rvfi -1 1))




