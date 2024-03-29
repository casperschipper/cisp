(# tab1
	(fillf 128 -.1 .1))

(~ writeOne
	(write tab1 (rv -.1 .1) (count 128)))

(schedule
	(~ writeOne) 
	(/
		1.0
		(line (seq 1 1000) (ch .1 .3 .5 1 3 10))))

(fun stepper
    (hold
		(ch -1 1)
		(mtof
			(t
				(seq 0 100)
				(ch .1 .3 .5 1 3 10)))))

(# possibleSteps
	(list 33. 22 2 1 1 1 1 1 2 2 2 2 3 1 1 1 1 1 1 1 1 1 1 1 1 1 1500 3009))

(fun a 
	(line
		(seq 0 (table-cap possibleSteps))
		(ch 1 2 4 8 16 32)))

(~ stepSize
	(index
		possibleSteps
		(rv a a)))

(step-pan-gen
	(list-walk tab1 stepper)
	(~ stepSize)
	(hold
		(list-walk tab1 stepper)
		(mtof
			(line
				(seq 0 100)
				(rv 0 5)))))