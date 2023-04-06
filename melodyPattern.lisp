(~ low
	(line
		(seq 0 10)
		(st 7)))

(~ high
	(line
		(seq 0 10)
		(st 7)))

(step-gen
	(seq -1 1)
	(rv low high))