(# mem1 (alloc 441000))

(fun maxy
	(t
		(ch 10 330 44100 2000)
		(ch 3 7 11)))

(fun pitch
	(t
		(seq 1 2 3)
		(ch 1 3 4)))

(fun slow
	(line
		(seq -1 1)
		(ch 1 7 11 33)))

(fun reader
	(lookup OSC.table9 
			(+ (index mem1 (bounded-walk (st 0) maxy 
				(sometimes (rv 1 maxy)  (st 1) 10000))) slow)))

(fun amp
	(write mem1 
		reader
		(count (- (table-cap mem1) 1 ))))


(step-gen
	amp
	pitch
	:pan (rvfi -1 1))