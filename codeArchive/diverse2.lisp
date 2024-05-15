(# mem1 (alloc 1000))

(fun maxy
	(t
		(ch 100 40)
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
				(sometimes (* (seq mem1) 100)  (st 1) 100000))) slow)))

(fun amp
	(write mem1 
		reader
		(count (- (table-cap mem1) 1 ))))


(step-pan-gen
	amp
	pitch
	(fractHold (seq OSC.table9) (ch 1 3 7 10 100)))