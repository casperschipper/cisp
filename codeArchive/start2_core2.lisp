(fun a 
	(line 
		(seq 11)
		(ch 1 2 5 7 )))


(# tab1
	(1. 3. 4. 16.0 18.0 24.0 2.0 52.0 19.0 18.5 203))

(fun top
	(t
		(ch 10 20 30)
		(ch 4.0 3.0 7.0)))

(samp-schedule 
	(write tab1 (rv 1 top) (count (table-cap tab1)))
	(rv 0 5000))

(fun indexer
	(rv
		(line (seq 0 a) (rv .5 1.7))
		(line (seq 0 a) (rv .3 4.7))))


(fun tone
	(t 
	(reset (walk 0.001 (ch -0.001 0.001)) (st 0.001) (rv 5 10))
	(ch 1.0 1.5 3.0 4.5)))


(clone 
(step-gen
(hold (index-lin OSC.table1 (line (seq 0 128) tone)) (index tab1 indexer))
(st 1)
:pan (rvfi -1 1))
3)