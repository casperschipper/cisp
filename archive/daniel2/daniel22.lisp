(# t1 (fillf 44100 0 0))

(fun sig
	(t 
		(seq -1 1)
		(st 0.1)))

(step-gen
	(write t1 (+ sig (* (index-lin t1 (line (seq 0 44100) (st 1))) 0.5)) (count 44100))
	(st 1))