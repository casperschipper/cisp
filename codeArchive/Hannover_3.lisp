
(~ update
	(t
		(monitor (rv 0.0 1.0))
		(st 10)))

(sync 0.125)

(midi-note-channel
	(beat 120 4)
    (ftom (reset 
    	(mup-walk 200 
    		(hold 
    		(seq 0.6666667 1.333333) (seq 2 1 1 1 1 2 5 8) ))
    	(st 100) (seq 11 12)))
	(st 2.0)
	(index (80 20 60 100 40) (line (seq 0 6) (~ update)))
	(st 1))

/*
0.500204
0.147739
0.520189

0.157216 :(float)
0.698773 :(float)

0.186067 !!!!
*/