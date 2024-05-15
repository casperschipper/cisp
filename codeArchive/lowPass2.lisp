(# tab1
	(100. 20 3000 4000 3000 20 30 40 1 2 3 4 5 6 6 1 1 1 10 200 ))


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
	(cycle (* (t (index (100 200 300 400 500 1000 1200 1400 1600 2000) (bounded-walk 0 10 (seq 1 1 1 2 2 2 -1)) ) (st 0.14)) (lowpass (hold (seq -1 (rv 0 0.3) 1) holder) (line (seq 10.0 100.0) (ch 0.01 0.2 0.3 0.10 0.01 4)) (st 0.5) (st 3.0))))
	(st 1)
	:pan (rvfi -1 1))
1)