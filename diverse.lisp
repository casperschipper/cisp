(# mem1 (alloc 1000))

(fun maxy
	(t
		(ch 500 2000)
		(ch 1 1.5 3)))

(fun pitch
	(hold
		(hold
			(seq 1 2 3 4)
			(ch 3 5 100 2000)
		) (ch 100 200 1000 1)))

(fun slow
	(line
		(seq -1 1)
		(ch 1 7 11 33)))

(fun reader
	(lookup OSC.table9
			(+ (index mem1 (bounded-walk (st 0) maxy 
				(sometimes (* (seq mem1) 100)  (st 1) 10000))) slow)))

(fun amp
	(write mem1 
		reader
		(count (- (table-cap mem1) 1 ))))


(step-gen
	amp
	pitch
	:pan (rvfi -1 1))