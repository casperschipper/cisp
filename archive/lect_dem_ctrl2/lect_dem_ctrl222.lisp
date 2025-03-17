


(~ tim (seq 0.2 0.15))

(~ pit 
	(seq 
		(reset (walk 72 (ch -5 5)) (st 72) (st 4)) 
		(reset (walk 67 (ch -7 7)) (st 72) (st 3))  (reset (walk 64 (ch 0 0 0 0 0 1 2)) (st 64) (ch 7 11))
		(reset (walk 60 (ch -5 5)) (st 60) (st 3))))

(fun a
	(line
		(seq 1.0 0.1)
		(ch 1 2 3)))

(~ dura 
	(seq a 0.1 0.1))

(~ velo
	(seq 
		(latch (st 110) (ch 3 4 5)) 
			80 80))