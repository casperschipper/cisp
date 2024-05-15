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



(pulse-pan-gen
	(impulse 
		(index (10 20 300 23 44 55 300 500 4000 10000 333 555) (loop (rv a a) b b)) (seq tab1 true))
	(hold (ch 1 2 10) (ch 40 50 100 4000))
	(impulse 
		(index (10 20 300 23 44 55 300 500 4000 10000 333 555) (hold (rv a a) b)) (seq tab1 true)))