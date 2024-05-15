(# tab1 (collect  (bounded-walk 1.0 127.0 (st 1.0)) 128))
(# tab2 (list 0.0))
(# tab3 (sine 512 (list 1.0)))


(samp-schedule
	(write tab2 (index tab1 (seq tab2)) (st 0))
	(st 1))

(samp-schedule
	(write tab1 (line (seq 1 1000) (hold (ch 0.001 0.01 0.03 0.0003 ) (rv 1 100))) (st 10))
	(seq 1 11))


(fun a 
	(t 
	(rv 1 400)
	(ch 1 2 3)))

(samp-schedule
	(write tab1 (line (seq 1 1000) (ch 0.001 0.1 0.2)) (st 2))
	(seq 1 a))



(step-gen
	(index tab3 (seq tab2) )
	(st 1)
	:pan (rvfi -1 1))

