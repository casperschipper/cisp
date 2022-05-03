(fun a
	(seq (fillf 32 -1 1) true))

(fun b 
	(latch 
		(hzSineseg (line (rv 1000 20000) (ch 0.001 0.01 0.1 0.2)))
		(st 1000)))

(fun c
	(latch (loop (rv -1 1) (rv 1 16) (st 16)) (ch 1000 10 20000)))

(fun d
	(latch 
		(hold (seq -1 1) (ch 1 1000 4000 8000))
		(rv 1 100000)))

(fun e 
	(latch
		(hold (seq -1 1) (ch 1 2 4 8))
		(rv 1 100)))

(fun f
	(latch
		(line
			(seq -1 1)
			(ch 4 8 70 100))
		(ch 10 100 200))
	)

(fun g
	(latch
		(line
			(rv -1 1)
			(rv 1 10)
			)
		(st 1024)))

(fun sil
	(latch (st 0) (rv 1 10000)))

(fun top
	(line
		(seq 0 16)
		(st 7)))

(fun bottom
	(line
		(seq 0 16)
		(st 11)))

(clone
(step-gen
	(index (list a sil b sil c sil d sil e sil f sil g sil) (rv top bottom))
	(st 1)
	:pan (rvfi -1 1))
10)
	