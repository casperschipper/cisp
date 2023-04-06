(# table1 (fillf 441000 0 0))

(fun indexa
	(bounded-walk (st 0) (st 327680) (+ (bounded-walk (st 0.01) (st 8.0) (bounded-walk (st -0.001) (st 0.001) (ch -0.00001 0.00001))) 1.0)))

(~ writer
	(write table1 (* (+ (audioIn 1) (audioIn 0)) 1) (count 441000)))

(samp-schedule 
	(~ writer)
	(st 1))

(clone 
	(step-gen
		(index-lin table1 indexa)
		(st 1) :pan (rvfi -1 1))
6)