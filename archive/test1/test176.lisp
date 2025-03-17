
(# tab1 (fillf 441000 0 0))

(step-gen
	( * 0.1 (+ 
		
		(* (st 0.9) (seq tab1)) 
		(write tab1 
		(delay (cycle (st 330)) 441000 (line (seq 0 (table-cap tab1)) (bounded-mup-walk (st 0.0000001) (st 10.0) (ch 0.001 0.1 2.0 3.0 0.6666667 1.5))))
		(count (table-cap tab1)))))
	(st 1))



(step-gen
	(seq tab1)
	(st 1))