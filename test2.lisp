(fun phasing
	(+ 
	(list 
		(hold (seq (fill 33 1 20)) (seq 1 18)) 
		(seq (fill 24 1 2)) 
		(seq (fill 25 1 2))
		(seq (fill 26 1 2)))))

(step-pan-gen
(seq 
(fillf 16 -1 1))
phasing
(hold (seq (fillf 32 -1 1)) phasing))