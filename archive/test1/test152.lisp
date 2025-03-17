
(# tab1 (fillf 44100 0 0))

(step-gen
	( * 0.1 (+ 
		
		(* (st 0.9) (seq tab1)) 
		(write tab1 
		(delay (cycle (st 330)) 10000 (line (seq 0 100) (bounded-mup-walk (st 0.0000001) (st 1.0) (ch 0.6666667 1.5))))
		(count (table-cap tab1)))))
	(st 1))