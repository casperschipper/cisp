
(# tab1 (fillf 441000 0 0))

(step-gen
	( * 0.5 (+ 
		
		(* (st 0.5) (seq tab1)) 
		(audioIn 0)
		(write tab1 
		(delay (cycle (st 440)) 441000 
			(line (seq 0 (table-cap tab1)) (bounded-mup-walk (st 0.0000001) (st 10.0) (ch 0.5 2.0 4.0 (/ 2.0 3.0) (/ 3.0 2.0)))))
		(count (table-cap tab1)))))
	(st 1))



(step-gen
	(* (index-lin tab1 (line (seq 0 (table-cap tab1)) (bounded-mup-walk (st 0.01) (st 20.0) (ch 0.5 2.0 4.0)))) 0.1)
	(st 1)
	:pan (rvfi -1 1)
)

(step-gen
	(* (index-lin tab1 (line (seq 0 (table-cap tab1)) (bounded-mup-walk (st 0.01) (st 20.0) (ch 0.2 1.5 2.0 4.0)))) 0.1)
	(st 1)
	:pan (rvfi -1 1)
)

(step-gen
	(* (index-lin tab1 (line (seq 0 (table-cap tab1)) (bounded-mup-walk (st 0.01) (st 10.0) (ch 0.001 1298321)))) 0.1)
	(st 1)
	:pan (rvfi -1 1)
)
