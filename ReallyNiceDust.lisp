(# foo (fillf 32 1 200))

(fun a 
	(line
		(seq 0 (table-cap foo))
		(st 7)))

(fun b
	(line
		(seq 0 (table-cap foo))
		(st 11)))

(fun c
	(t
		(seq 0.00001 0.001 0.01 0.1 0.2 0.5 1.0 2.0)
		(seq 0.01 0.1 0.2 0.5 1.0 2.0)))

(fun zeroish
	(t
		(seq 0 1 -1)
		c
	))

(fun valuegen
	(index foo (line (seq a b) c)))

(step-pan-gen
(seq
 (latch (seq -1 1) (st 1))
 (latch zeroish valuegen))
(st 1)
(hold 
	(seq (fillf 16 -1 1))
	valuegen))