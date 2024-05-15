(# mem1 (alloc 40))

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
		(ch 2000 12000)
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

(fun panextreme
	(line
		(seq 0 1)
		(ch 1 2 5 10)))

(step-pan-gen
	amp
	pitch
	(line (seq panextreme panextreme) (fractRandTimer (ch 0.01 0.001 .1 .2 .5 1 2 4))))



