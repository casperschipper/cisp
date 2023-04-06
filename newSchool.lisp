

(# tab1 (fillf 4096 -1 1))

(fun stepy
	(loop
		(count (table-cap tab1))
		(ch 4)
		(ch 2 1 5)))

(fun indexer
	(bounded-walk (st 0) (table-cap tab1) stepy))

(fun tabwrite
	(write tab1 (audioIn 0) (count (table-cap tab1))))

(schedule
	tabwrite
	(seq
		(tLatch (st 0.001) (st 0.5))
		(tLatch (rv 1 4) (rv 1 4))))

(step-gen
	(index tab1 indexer)
	(st 1))

(step-gen
	(seq tab1)
	(st 1)
	:pan 0.9)