

(# tab1 
	(0.5 1.0 2.5 1.5 2 1 4 3 0.5 0.25 0.125))

(fun jitterSpeed
	(t
		(rv 0.0001 0.003)
		(seq 0.01 0.2 0.5 1.0)))

(fun jitter
	(index
		tab1
		(bounded-walk (st 0) (table-cap tab1) jitterSpeed)))

(fun idx
	(index
		tab1
		(line
			(+ (seq 0 (table-cap tab1)) jitter)
			(seq (rv 0.001 0.05) 0.2 0.3 5 10))))

(clone
(step-gen
	(index-lin 
		(sine 1024 (fillf 16 -1 1))
	
		(+ (bounded-walk (st 0) (st 1024) idx) (line (seq 0. 400) (rv 0 1))))
			
	(st 1)
	:pan (rvfi -1 1))
4)