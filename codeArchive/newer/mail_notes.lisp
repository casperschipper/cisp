(~ timer (ch 0. 0.15 0.15 0.15 0 0 0 0))

(fun a
	(hold
		(seq 0  0 0 0 0 0 2 4 7)
		(ch 4 7 11)))

(fun b
	(hold
		(seq 0 2 4 7)
		(ch 4 7 11)))

(fun i
	(hold
		(ch 0 1 2 3 4 5)
		(ch 1 1 1 1 1 (rv 3 8))))

(~ pitch 
	(index 
		(list 
			(+ (st 40) a)
			(+ (st 45) b)
			(+ (st 50) a)
			(st 55)
			(+ (st 60) a)
			(+ (st 65) a))
		(seq 0 1 2 i 1 2 i 1)
		))

(~ velo (ch 80 100 120))

(~ dura (ch 0.1 0.2 0.6 1.0 2.0))