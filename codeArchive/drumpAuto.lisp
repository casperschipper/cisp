/*
(midi-note-channel 
	(st 0.125)
	(ch 60 64 67)
	(st 1.0)
	(st 100)
	(st 1)
	)
*/

(midi-note-channel 
	(line (seq 0.1 0.2) (ch 0.01 0.02 0.3 0.4 2))
	(hold (seq 34) (rv 1 4))
	(st 1.0)
	(loop (ch 40 40 20 20) (rv 3 5) (st 3))
	(hold (ch 1 2 3 4) (ch 1 1 1 2))
	)
