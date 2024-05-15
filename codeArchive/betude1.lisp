(# mem1 (alloc 160))

(fun slow
	(line
		(seq -.5 .5)
		(hold (ch 3 15 6) (hold (seq 2 3 4) (seq 3 2 4 1 3)))))

(fun amp
	(write mem1 
		(lookup OSC.table1 
			(+ (seq mem1) slow))
			(count (- (table-cap mem1) 1))))

(~ pitch
	(t
		(series 3 5 4 1)
		(t 
			(ch 7 5) (ch 11 12))))

(clone

(step-pan-gen
	amp
	(~ pitch)
	(t
		(rv 0 1) (st 55)))

1)

