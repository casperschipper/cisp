(fun a 
	(t
		(mup-walk 0.01 (ch 0.5 2 0.1))
		(st 0.01)))

(step-gen
	(index-lin (-1.0 1.0) (line (seq 0 1) (/ 1.0 a)))
	(st 1))