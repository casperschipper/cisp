(fun dexy
	(line
		(sometimes (st 3) (seq 0.01 0.04) 100)
		(st 7)))


(midi-note-channel
	(line (seq 0.002 (sometimes (st 0.6) (st 0.01) 100)) (rv 1 3))
	(+ 48 
		(index 
		 (0 4 7 12 19 24 26) (line (seq 8 0) (seq dexy 0))))
	(st 0.1)
	(loop  (rv 0 128) (st 4) (st 17))
	(st 1))