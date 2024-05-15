(# buf1 (alloc 200000))

(fun a (rv 0 200000))

(samp-schedule
	(write buf1 (audioIn 0) (count (table-cap buf1)))
	(st 1))

(~ b
	(ch 0.0001 0.1 0.4 0.2 1.0))

(~ c
	(ch 0.005 0.02 0.2 0.45 0.2 3.0))

(~ loops
	(line 
	(hold (ch 1 20 35 100 200 1000) (st 2))
	(ch 1 3 5)))

(fun loopLength
	(t
		(rv (~ b) (~ c))
		(rv 3 7)))

(clone
	(step-gen
		(index-lin buf1 (line (loop (seq a a) (~ loops) (st 2)) loopLength))
		(st 1)
		:pan (rvfi -1 1))
	12)
