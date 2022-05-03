(# buf1 (alloc 200000))

(~ low
	(line
		(seq 0 (table-cap buf1))
		(ch .3 .5 1.5)))

(fun a 
	(t 
		(line 
			(seq 0 (~ low)) 
			(t (ch 0.1 0.2 1 10) (ch 3 5 7)))
		(st 0.1)))

(samp-schedule
	(write buf1 (audioIn 0) (count (table-cap buf1)))
	(st 1))

(~ b
	(t 
	(ch 0.0001 0.1 0.4 0.2 1.0)
	(ch 3 5 11)))

(~ c
	(t 
		(ch 0.005 0.02 0.2 0.45 0.2 3.0)
	(ch 3 5)))

(~ loops
	(line 
	(hold (ch 1 20 35 100 200 1000) (st 2))
	(ch 1 3 5)))

(fun loopLength
	(t
		(rv (~ b) (~ c))
		(rv 3 7)))

(~ loopyLenght
	(seq 2 5 10 1 2 2 4 100)
	(st 3))

(clone
	(step-gen
		(index-lin buf1 (line (loop (seq a a) (~ loops) (~ loopyLenght)) loopLength))
		(st 1)
		:pan (rvfi -1 1))
	12)
