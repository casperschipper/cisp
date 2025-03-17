(~ pit 
	(seq 
		(reset (walk 60 (ch -5 5)) (st 60) (rv 5 10)) // rv will just pick a random value from the range
		(series 74 72 70 68)
		(series 50 55 60 65)
		(series 60 67 57 55))) // we can also do a series (without repetition)

(~ dura 
	(seq 0.4 0.1 0.1))

(~ velo 
	(seq (series 100 40 70) (series 80 40 70) (series 40 80 110)))