(# tab1 (collect 
	(walk 1 (seq 1 (latch (list-walk (0.0 1 22 3 3 1 2  1 21 1 3 1 3 12  21)) (st 100000)))) 10))

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
(seq (fillf 128 -1 1))
(index tab1 
	(line 
		(seq a b)
		c))
)