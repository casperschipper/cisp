(~ timer (st 0.1))

(fun env 
	(line
		(seq 0 1 1 0)
		(ch 1 3 6)))

(fun stepr
	(t
		(ch 0 2 5 12)
		(ch 3 5 7)))

(~ mag
	(line (seq 0 0 5)
		(ch 3 5 7)))

(~ pitch
	(+ (* (rv (* (st -1) (~ mag)) (~ mag)) stepr) 60))

(~ velo (st 90))

(~ dura (st 0.1))

