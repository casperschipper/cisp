(samp-schedule
	(write
		OSC.table1
		(bounded-walk 30 60 (ch 1 7 -12 -7 12))
		(count 12))
	(line (seq 0 44100) (ch 1 3 7)))