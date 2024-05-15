(# mem (list 0.))

(samp-schedule 
	(write mem 
		(index 
			(list 
				(rv 0 3)
				(seq 0 1 2 3)
				(st 3)
				(st 0))
		(seq mem)) 
		(st 0))
	(st 4410))

(step-gen
	(seq -1 1)
	(index (100. 200 300 400) (seq mem)))

