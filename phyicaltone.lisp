(# tab1 (fillf 1024 -1 1))

(fun devi
	(t
		(/ 1
			(ch 1000000 1000000))
			(ch 1 2 3 4)))

(clone
(step-pan-gen 
	(index-lin tab1
		(line (seq 0 1024) (t 
			(+ (/ (ch 0.001 0.0002 0.00001 0.004) 3) devi)
			 (ch 0.1 0.2 0.5 1 2 ))))
	(t (ch 1) (ch .1 .3 .5))
	(line (seq -1 1) (ch .1 2 4 8))
	)
2)
