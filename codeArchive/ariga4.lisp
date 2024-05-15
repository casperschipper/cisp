(# tab1 (sine 128 (1.0)))

(fun a 
	(line (seq 0.6 0.7)
		(st 10)))

(step-gen
	(index-lin tab1 (walk 0 (t (reset (bounded-mup-walk 0.1 10.0 (ch a 1.5)) (st 1.0) (st 100.0)) (ch 0.1))))
	(st 1))
