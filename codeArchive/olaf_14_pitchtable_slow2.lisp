(samp-schedule
	(write
		OSC.table1
		(bounded-walk 40 120 (hold (seq 0 0 0 12 -12) (seq 1 2)))
		(count 0))
	(line (seq 4410 4410) (ch 1 3 7)))

(~ tableMax
	(st 1))

(~ deltaBus (seq (latch (seq 1 2 0) (rv 1 2)) (ch 3 0 0 0)))