(# tab1
	(200. 3 4 100000 10 11 74 16 16 1012))


(fun top
	(line
		(seq 0 (table-cap tab1))
		(ch 3 5 6)))

(fun indexer 
	(rv top top))

(fun holder
	(index tab1 indexer))


(clone
(step-gen
	(cycle (* 20000 (lowpass (hold (seq -1 1) holder) (st 100.0) (st 0.3) (st 3.0))))
	(st 1)
	:pan (rvfi -1 1))
3)