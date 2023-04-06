(~ pitch 
	(+ (seq (list-walk (list 60 65) (ch -1 1)) (hold (ch 67 72) (st 2)))
		(hold (seq 0 4 7 -2) ())
	))

(~ velo
	(seq 100 80 40))