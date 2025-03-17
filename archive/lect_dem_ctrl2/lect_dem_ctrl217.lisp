(~ tim (st 0.2))

(~ pit 
	(seq 
		(reset (walk 72 (ch -5 5)) (st 72) (st 4)) 
		(reset (walk 67 (ch -7 7)) (st 72) (st 3))  64 
		(reset (walk 60 (ch -5 5)) (st 60) (st 3))))

(~ dura 
	(seq 0.5 0.1 0.1))

(~ velo
	(seq 
		(latch (st 127) (ch 3 4 5)) 
			80 80))