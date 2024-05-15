(fun a
	(line 
		(seq 1 1 1000)
			(ch 1 3 5)))

(# tab1 (fillf 1024 -1 1))

(samp-schedule
	(write
		tab1
		(rv -1 1)
		(count 1024)
		)
	a)

(step-gen
	(seq
	(index tab1 (count2 (rv 1 1000)))
	(latch (st 0) (rv a a)))
	(st 1)
	:pan -1)

(step-gen
	(seq
	(index tab1 (count2 (rv 1 1000)))
	(latch (st 0) (rv a a)))
	(st 1)
	:pan 0)

(step-gen
	(seq
	(index tab1 (count2 (rv 1 1000)))
	(latch (st 0) (rv a a)))
	:pan 1)