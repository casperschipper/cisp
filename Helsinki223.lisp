

(fun a 
	(line
		(seq 0 32)
		(ch 3 6)))

(fun indexer
	(rv a a))

(step-gen
(index (fillf 32 -1 1) indexer)
(index (fillf 32 1 100) indexer))
