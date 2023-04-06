(# mem1 (alloc 40))

(fun pitch
	(t
		(seq 3 2 5)
		(ch 7 11 15)))

(fun slow
	(line
		(seq -1 1)
		(ch 3 15 4 1 33 .1)))

(fun amp
	(write mem1 
		(lookup OSC.table1 
			(+ (seq mem1) slow))
		(count (- (table-cap mem1) 1 ))))


(clone
(step-gen
	(loop amp 
		(loop (rv 1 100) (st 4) (st 4)) (loop (rv 1 40) (st 4) (st 4)))
	pitch
	:pan (rvfi -1 1)) 8)