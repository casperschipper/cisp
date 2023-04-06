(# ts 
	(0.2 0.4 0.6 0.8 1.0 1.2 1.4))

(fun indexer
	(line
		(seq 0 (table-cap ts))
		(ch ts)))

(fun lines
	(line
		(seq 0 1)
		(index ts indexer)))

(step-gen
	(cycle 
		(t 
			(mtof 
			(* (+ lines 40) 40))
			(st 1)))
	(st 1))
