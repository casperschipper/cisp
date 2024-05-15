(# tab1 (collect 
	(walk 1 (seq 1 (latch (ch 1 0 0 0 20 3 4) (st 100000)))) 10))

(# tab2 (collect
	(mup-walk 0.001 (st 2)) 10))

(fun topper
	(line
		(mtof (rv -40 10))
		(fractRandTimer (ch 0.01 0.1 0.2 0.5 1.0))))


(~ writer
	(write
		tab1
		(rv topper topper)
		(count 10)))

(schedule
	(~ writer)
	(line (seq 0.01 0.5) (ch 3 4 7)))

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
	

(line-pan-gen
(seq (fillf 16 -1 1))
(index tab1 
	(line 
		(seq a b)
		c))
(line
	(seq -1 1)
	(* c 20))
)