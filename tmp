(# tab1
	(200. 3 4 10 11 74 16 16 1012))


(fun top
	(line
		(seq 0 (table-cap tab1))
		(ch 3 5 6)))

(fun indexer 
	(rv top top))

(fun holder
	(index tab1 indexer))


(step-gen
	(cycle (lowpass (* 10000 (hold (rv -1 1) holder)) 1000.0 0.1))
	(st 1)
	:pan (rvfi -1 1))