(# mem1 (alloc 10))

(fun pitch
	(t
		(seq 3 2 5)
		(ch 7 11 15)))

(fun slow
	(line
		(seq -1 1)
		(ch 3 15 4 1 .1 .4)))

(fun amp
	(write mem1 
		(lookup OSC.table1 
			(+ (seq mem1) slow))
		(count (- (table-cap mem1) 1 ))))


(clone
(step-gen
	amp
	pitch
	:pan (rvfi -1 1)) 8)