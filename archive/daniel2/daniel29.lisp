(# t1 (fillf 44100 0 0))

(fun sig
	(t 
		(seq -.1 .1)
		(st 0.1)))

(step-gen
	(leakDC 0.95 (write t1 (+ sig (* (index-lin t1 (line (seq 0 (rv 0 44100)) (seq 0.001 0.1 0.2 0.3))) 1.0)) (count 44100)))
	(st 1))