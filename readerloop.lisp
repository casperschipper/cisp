(# mem1 (alloc 40))

(fun pitch
	(t
		(seq 1 2 3)
		(ch 1 3 4)))

(fun slow
	(line
		(seq -1 1)
		(ch 3 15 4 1 33 .1)))

(fun reader
	(lookup OSC.table1 
			(+ (index mem1 (bounded-walk (st 0) (table-cap mem1) 
				(index (
					(st 1)
					(ch 1 20 30)
					)
				(sometimes 1 0 10000)))) slow)))

(fun amp
	(write mem1 
		reader
		(count (- (table-cap mem1) 1 ))))


(step-gen
	amp
	pitch
	:pan 0)