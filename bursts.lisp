(step-pan-gen
	(seq 
		(latch (seq (collect (rv -1 1) 100)) (rv 1 100))
		(latch (st 0) (hold (ch 3 1 1000 1) (ch 1 2 10)) ))
(st 1)
(seq 
		(latch (seq (collect (rv -1 1) 10)) (rv 1 100))
		(latch (st 0) (hold (ch 3 2 1000 1) (ch 1 2 10)) )))