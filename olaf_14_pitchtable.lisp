(samp-schedule
	(write
		OSC.table1
		(bounded-walk 40 120 (hold (seq -7 7 12) (seq 1 2)))
		(count 3))
	(line (seq 4410 4410) (ch 1 3 7)))

(~ tableMax
	(st 3))

(~ deltaBus (seq (latch (st 1) (rv 1 2)) (ch 5 0 0 0)))