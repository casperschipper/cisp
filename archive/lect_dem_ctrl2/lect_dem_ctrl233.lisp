(~ tim
	(seq 0.2 0.17))

(~ pit
	(seq 
		(reset (walk 72 (ch -12 12 -5 5)) (st 72) (ch 3 3 3 3 7))
		(reset (walk 67 (ch -2 2)) 67 (st 4))
	60 58))

(fun a
	(ch 127 120 121 90))

(~ velo
	(seq a 80 40))

(~ dura
	(seq (ch 0.1 0.1 0.05 1.0) 0.5 0.01))