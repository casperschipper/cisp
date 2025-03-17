(# tab1 
	(1 2 3 4 5 6 7 8 9 10))

(# tab2 
	(10 22 33 44 55 66 88))

(# tab3
	(100 200 300 500 1000 ))

(fun tableSelect
	(t
		(rv 0 3)
		(rv 1 5)))

(fun idxr 
	(t
		(index 
			((ch 0 10)
			(rv 0 10)
			(line (seq 1 6) (ch 0.01 0.2 0.3 0.4 0.5 1.0))))

(step-gen
(seq -1 1)
(index  
	(index tab1 indxr)
	(index tab2 indxr)
	(index tab3 indxr)
	tableSelect
	)
)