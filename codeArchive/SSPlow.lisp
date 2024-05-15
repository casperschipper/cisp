(# tab1
	(1000.0 100.0 10. 1. 2. 3. 4 8 1000 200000))


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
	(cycle (* 100000 (lowpass (hold (seq -1 (rv 0 0.3) 1) holder) (st 2000.0) (st 0.01) (st 3.0))))
	(st 1)
	:pan (rvfi -1 1))
3)