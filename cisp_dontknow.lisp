
(midi-note-channel
	(beat 120 4)
    (ftom (reset 
    	(mup-walk 200 
    		(hold 
    		(seq 0.6666667 1.333333 1.5 0.75) (seq 2 1 1 1 1 2 5 8) ))
    	(st 100) (seq 11 12)))
	(st 2.0)
	(index (80 20 60 100 40) (line (seq 0 6) (~ update)))
	(st 3))