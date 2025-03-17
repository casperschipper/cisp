// HELLO WORLD!

(# tab1 (fillf 44100 0 0))

(samp-schedule 
	(write tab1 (* (audioIn 0) 3) (count 44100))
	(st 1))


(clone 
(step-gen
	(index tab1 (line (seq 0 44100) (ch 0.01 0.1 0.5 1.0 2.0 4.0)))
	(st 1)
	)
3)