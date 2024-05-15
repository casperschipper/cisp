(# mem1 (alloc 45))

(fun pitch
	(t
		(list-walk (1 1 2 3 5 8))
		(ch .1 .5 .25)))

(fun slow
	(line
		(seq -1 1)
		(ch 3 15 4 1 .1 .4)))


(fun filter (arg)
	(biquad arg 0 (st 50) 0.9 1.0))

(fun amp
	 (write mem1 
		(lookup OSC.table1 
			(+ (list (seq mem1) slow (audioIn 4))))
		(count (- (table-cap mem1) 1 ))))




(step-gen
	amp
	pitch
	:pan (rvfi 0 1))