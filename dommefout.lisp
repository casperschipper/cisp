(fun dexy
	(line
		(seq 1.5 0.01)
		(st 7)))


(midi-note-channel
	(st 0.1)
	(+ 48 
		(index 
		 (0 4 7 12 19 24 26) (line (seq 8 0) (seq dexy 0))))
	(st 0.1)
	(st 80)
	(st 1))