(fun update
	(t 
		(ch 1 2 3 5 10 16 32 300 4000)
		(ch 0.1 0.2 0.5 1.0))
	)

(# tab1
	(fillf 1024 0 0))

(samp-schedule
	(write tab1 (bounded-walk -1.0 1.0 (hold (seq -0.01 0.01) update)) (count 128))
	update)


(step-gen
	(index-lin tab1 (line (seq 0 1024) (bounded-mup-walk 0.00001 0.01 (t (ch tab1) (ch 0.1 0.2 0.3 0.5 1.0)))))
	(st 1)
	:pan (rvfi -1 1))