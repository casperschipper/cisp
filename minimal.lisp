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
					(hold (seq 0 1 2 3 4) (rv 0 7000)) // 0
					(hold (seq 0 1 2 3 4) (rv 0 88000)) // 1
					(hold (seq 0 1 2 3 4) (rv 33 99000)) // 2
					(hold (seq 0 1 2 3 4) (rv 33 155000)) // 3
					(hold (seq 0 1 2 3 4) (rv 33 17700))) // 4
			(seq mem))
		(st 0)
		)
	(st 1))

(step-gen
	(seq -1 1)
	(index 
		(list 1 2 3 4 2)
		(seq mem))
	:pan (rvfi -1 1))




