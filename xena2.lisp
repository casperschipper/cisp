(# tab1 (collect (bounded-walk -1 1 (loop (rv -0.1 0.1) (rv 3 40) (rv 3 7))) 1024))

(fun boundary
	(t
		(ch 0 0.1 0.01 4000)
		(ch 0.1 0.4 1.0 2.0 3.0)))

(fun indexer 
	(bounded-walk (st 0) (st 128)
		(bounded-walk (* -1 boundary) boundary 
			(list-walk tab1 (loop (ch -1 1) (ch 4 5 6) (ch 1 2 4 6)) ))))

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


(step-gen
	(index-lin
		tab1
		indexer)
		(st 1)
)