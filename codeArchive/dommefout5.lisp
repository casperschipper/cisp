(fun dexy
	(line
		(sometimes (st 3) (seq 0.01 0.04) 100)
		(st 7)))


(midi-note-channel
	(t (seq (st 0.1) 1.0 (line (seq 0.002 (sometimes (st 0.1) (st 4.0) 100)) (rv 0.05 0.5))) (rv 1 9))
	(+ 48 
		(index 
		 (0 4 7 12 19 24 26) (line (seq 8 0) (seq dexy 0))))
	(st 0.1)
	(st 80)
	(st 1))