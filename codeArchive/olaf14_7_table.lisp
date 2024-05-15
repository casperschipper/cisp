(samp-schedule
	(write
		OSC.table1
		(bounded-walk 30 60 (hold (ch -12 12 7 -7 ) (ch 1 2)))
		(count 12))
	(line (seq 4410 4410) (ch 1 3 7)))