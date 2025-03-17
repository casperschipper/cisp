(~ pit 
	(seq 
		(reset (walk 60 (ch -5 5)) (st 60) (rv 5 10)) // rv will just pick a random value from the range
		(reset (walk 60 (ch -12 12)) (st 60) (rv 5 10))
		(latch (walk 72 (ch -1 1 -2 2)) (st 4)) // latch allows you to take over a stream.. it will play 4 notes before moving on...
		(rv 50 55 60 65)
		(latch (walk 72 (ch -12 12 -2 2)) (st 4)))) 

(fun a 
	(line
		(seq 0.1 3.0)
		(ch 3 1 5))) // this will generate a line segmnet from 0.1 to 1.0 and take (ch 3 1 5) seconds...

(~ dura 
	(seq a 0.01 0.03))

(~ tim
	(st 0.001))





(~ velo 
	(seq (series 100 10 70) (series 126 40 70) (series 40 80 110)))