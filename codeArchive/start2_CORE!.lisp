(fun a 
	(line 
		(seq 4 11 3 1)
		(ch 1 2 5 7 )))


(# tab1
	(1. 3. 4. 16.0 18.0 24.0 2.0 52.0 19.0 18.5 203))

(samp-schedule 
	(write tab1 (rv 1 200) (count (table-cap tab1)))
	(st 5000))

(# tab2
	(sine 256 (1.0)))

(fun indexer
	(rv
		(line (seq 0 a) (st 7))
		(line (seq 0 a) (rv 3 7))))


(clone 
(step-gen
(hold (index tab2 (line (seq 0 a) (st 0.004))) (index tab1 indexer))
(st 1)
:pan (rvfi -1 1))
3)