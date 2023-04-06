(fun a 
	(line 
		(seq 4 16 3 1)
		(ch 1 2 5 7 )))


(fun indexer
	(rv
		(line (seq 0 a) (st 7))
		(line (seq 0 a) (rv 3 7))))


(step-gen
(hold (seq -1 1) (index (fill 16 16 24) indexer))
(st 1))