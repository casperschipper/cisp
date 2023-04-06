(# previous (alloc 1))

(fun littlePush
	(line
		(seq 0 128)
		(rv 5 70)))

(audioIn) 

(fun writer
	(write previous 
		(index-lin 
			OSC.table1 
			(+ (* (+ (seq previous) 1) 64) littlePush)
			)
		(st 1)))

(fun writer2
	(write OSC.table1
		(seq previous)
		(t
			(seq 
				(st 0)
				(count 128))
			(rv 3 5))
		)
	)

(samp-schedule
	(+ writer writer2)
	(st 1))

(line-gen
(seq previous)
(st 10))