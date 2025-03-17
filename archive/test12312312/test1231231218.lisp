(# tab1 
	(1. 2 3 4 5 6 7 8 9 10))

(# tab2 
	(10. 22 33 44 55 66 88))

(# tab3
	(100. 200 300 500 1000))

(fun tableSelect
	(rv 0 2))

(fun idxr 
	(index 
		(
			(ch 0. 10)
			(rv 0 10)
			(line (seq 1 6) (ch 0.01 0.2 0.3 0.4 0.5 1.0)))
	(ch 1 2 3)))


(step-gen
(seq -1 1)
(index  
	(list 
		(latch (index tab1 idxr) (st 100))
		(latch (index tab2 idxr) (st 100))
		(latch (index tab3 idxr) (st 100))
		)
	tableSelect
	)
)