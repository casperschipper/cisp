(# casper (fillf 1024 0 0))

(fun indexer
	(seq 
		(tLatch (rv 0 1024) (st 2.5))
		(tLatch (bounded-walk 0 1024 (weights ((1 1) (0 10000)) )) (st 2.5))))

(step-gen
	(read-write casper (count 1024) (rv -1 1) indexer 0)
	(st 1)
	)
