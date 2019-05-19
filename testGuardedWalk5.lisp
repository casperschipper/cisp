(# tab1 (collect 
	(walk 1 (seq 1 (latch (ch 1 0 0 0 20 3 4) (st 100000)))) 10))

(# tab2 (collect
	(mup-walk 0.001 (st 2)) 10))

(fun a
	(line
		(seq 0 10)
		(st 4)))

(fun b 
	(line
		(seq 0 10)
		(st 7)))

(fun c
	(index
		tab2
		(rv a b)))
	

(line-gen
(seq (fillf 32 -1 1))
(index tab1 
	(line 
		(seq a b)
		c))
)