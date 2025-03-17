(fun shift
	(t
		(ch 0 0 3 4 12)
		(rv 5 9)))

(~ a
	(reset 
		(walk 60 (seq shift shift))
		(st 60)
		(ch 3 5)))


(~ dura
	())