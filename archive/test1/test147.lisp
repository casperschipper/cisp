
(# tab1 (fillf 44100 0 0))

(step-gen
	( * 0.1 (+ 
		
		(* (st 0.9) (seq tab1)) 
		(write tab1 
		(delay (cycle (st 330)) 10000 (line (seq 0 10000) (ch 0.0001 0.0002 0.1 0.3 0.4 1.0 2.0)))
		(count (table-cap tab1)))))
	(st 1))