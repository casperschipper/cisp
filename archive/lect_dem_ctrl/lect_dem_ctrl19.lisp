

(~ pit 
	(seq (reset (walk 72 (ch -5 5)) (ch 72) (ch 3 5 7)) (list-walk (60 62 64)) 67 
		(reset (walk 72 (ch -7 7)) (ch 72) (ch 3 5 7))))

(~ velo 
	(seq (latch (st 127) (ch 3 4 5)) 50 40))

(~ dura 
	(seq (latch (st 0.1) (ch 3 4 5)) 0.01 0.02))