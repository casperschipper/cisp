(fun noisy
	(latch
	(loop (rv -1 1) (ch (grow 1 2 8)) (ch (grow 1 2 8)))
	(ch (grow 1 2 8))))

(fun spark
	(latch
		(seq 
			(st 1)
			(latch (st 0) (rv 100 2000)))
		(ch 100 2000)))

(fun squarish
	(latch
		(hold (seq -1 1) (hold (ch 1 2 3 5 33 55 100 200 100 800) (ch 3 5 1 1 1 1 10 200)))
		(ch 1 3 2000 3000 100000)))


(fun sinesegment
	(latch (sineseg 
		(ch (rv 20 100) (rv 10000 20000))) (ch 3 5 10)))

(fun a
	(line
		(seq 0 5)
		(ch .1 .3)))

(step-gen
	(index
	(list noisy spark squarish sinesegment) (rv a a))
	(st 1))