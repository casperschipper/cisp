(# tab1 (fillf 12 -1 1))
(# tab2 (fillf 44100 0 0))


(fun a 
	(loop (* (ch 0.01 .1 .2 3 4 8 1) (ch -1 1)) (line (ch 1 2 3 4 20 200 1200 300 50000) (ch (grow 0.01 2 4))) (st 4)))

(~ writeFun
	(write tab2 (index tab1 (walk 0 a)) (count (table-cap tab2)))
	)

(samp-schedule
	(~ writeFun) (sometimes 1. 10. (st 0.01)))

(clone
(line-pan-gen 
	(index-lin tab2 (walk 0 a))
	(t (hold (st 1) (ch 1 2 4 8 16 32 128)) a)
	(index tab2 (walk 0 a))) 4)