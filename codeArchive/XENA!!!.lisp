(~ tableBounds
	(hold
		(seq 0.1 0.01 1.0)
		(ch 15 17 32 300 3000)))

(# tab1 (collect (bounded-walk -1 1 (loop (rv (* -1 (~ tableBounds)) (~ tableBounds)) (rv 3 40) (rv 3 7))) 441000))

(~ boundary
	(t
		(ch 0 0.1 0.01 1 0.001 2 4 8 15 3000)
		(ch 0.1 0.4 1.0 2.0 3.0 5.0)))

(fun indexer 
	(bounded-walk (st 0) (table-cap tab1)
		(bounded-walk (* -1 (~ boundary)) (~ boundary)
			(list-walk tab1 (ch -1 1) ))))

(step-gen
	(index
		tab1
		indexer)
		(st 1))

(step-gen
	(index
		tab1
		indexer)
		(st 1))

(~ writer
	(write
		tab1
		(index-lin tab1
			indexer)
		(count 44100)))

(schedule
	(~ writer)
	(st 0.01))

(step-gen
	(index-lin
		tab1
		indexer)
		(st 1)
		:chan 1
)