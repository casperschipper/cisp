(~ pit 
	(seq 
		(reset (walk 60 (ch -5 5)) (st 60) (rv 5 10)) // rv will just pick a random value from the range
		(series 74 72 70 68)
		(series 50 55 60 65)
		(series 60 67 57 55))) // we can also do a series (without repetition)

(fun a 
	(line
		(seq 0.1 1.0)
		(ch 3 1 5))) // this will generate a line segmnet from 0.1 to 1.0 and take (ch 3 1 5) seconds...

(~ dura 
	(seq a 0.1 0.1))

(~ tim
	(seq 0.2 0.17))

(~ velo 
	(seq (series 100 40 70) (series 80 40 70) (series 40 80 110)))