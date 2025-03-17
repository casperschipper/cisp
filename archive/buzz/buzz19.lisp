(fun a 
	(t
		(mup-walk 1.0 (ch -0.5 1 2))
		(st 1.0)))

(step-gen
	(index-lin (-1.0 1.0) (line (seq 0 1) (/ 1.0 a)))
	(st 1))