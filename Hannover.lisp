
(~ update
	(t
		(monitor (rv 0.0 1.0))
		(st 10)))



(midi-note-channel
	(beat 120 4)
    (ftom (bounded-mup-walk 50 4000 (index (0.5 2 0.75 1.5 0.666667) (line (seq 0 6) (~ update)))))
	(st 0.3)
	(index (80 20 60 100 40) (line (seq 0 6) (~ update)))
	(st 1))

/*
0.500204
0.147739
0.520189

0.157216 :(float)
0.698773 :(float)
*/