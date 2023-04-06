(# tab1 (fillf 32 -1 1))

(schedule
	(write tab1 (rv -1 1) (count 8))
	(seq (latch (st 0.001) (st 8)) (latch (st 1) (st 1))))

(fun a
	(line
		(seq 0 10)
		(ch 3 7)))

(fun b
	(+ a 1))

(# mem (fillf 441000 0 0))



(step-pan-gen
	(* (write mem
		(impulse 
		(index (fill 10 10 100) (loop (rv a a) b b)) (seq tab1 true)) (hold (count2 (table-cap mem)) (seq (latch (st 1) (rv 1 100000)) (rv 1 100000))) ) 0)
	(st 1)
	(impulse 
		(index (10 20 300 23 44 55 300 500 4000 10000 333 555) (hold (rv a a) b)) (seq tab1 true)))

(clone
	(step-gen
	(index mem (+ (bounded-walk (st 0) (st 128) (hold (ch -1 1) (* b 100)) (line (seq 0 (table-cap mem)) (ch 2 4 8))))
		(st 1)
		:pan (rvfi -1 1))
	3)


