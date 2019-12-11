(# mem1 (alloc 100))

(fun pitch
	(t
		(seq 5 10 20 2.5)
		(ch 7 11 15)))

(fun slow
	(line
		(seq -1 1)
		(ch 3 15 4 1 .1 .4)))

(fun topOfFilter
	(line
		(ch 100 12000)
		(ch 2 3 5)))

(fun filter (input)
	(biquad input 0 topOfFilter 0.9 1.0))

(fun filter2 (input)
	(biquad input 1 topOfFilter 0.9 1.0))

(fun amp
	(write mem1 
		(* (tanh (+
				(filter (lookup OSC.table1 
				(+ (list-walk mem1 (st 1)) slow)))
				(filter2 (seq mem1)))) 0.99)


		(count (- (table-cap mem1) 1 ))))


(step-gen
	amp
	pitch
	:pan (rvfi -1 1))