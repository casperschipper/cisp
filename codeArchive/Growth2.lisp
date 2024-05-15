(fun a
	(latch
		(seq (fillf 256 -1 1))
			(st 64)))


(fun b 
	(latch 
		(hzSineseg (line (rv 1000 20000) (ch 0.001 0.01 0.1 0.2)))
		(st 64)))

(fun c
	(latch (loop (rv -1 1) (rv 1 16) (st 16)) (ch 1000 10 20000)))

(fun d
	(latch 
		(hold (seq -1 1) (ch 1 1000 4000 8000))
		(st 64)))

(fun e 
	(latch
		(hold (seq -1 1) (seq (fill 128 1 1000)))
		(st 64)))

(fun f
	(latch
		(line
			(seq -1 1)
			(line (seq 10 1000) (ch 50 100 1000 40000)))
		(st 64))
	)

(fun g
	(latch
		(line
			(rv -1 1)
			(rv 1 1000)
			)
		(st 64)))

(fun sil
	(latch (st 0) (rv 10000 30000)))


(# idxs (fillf 16 0 16))

(schedule
	(write idxs (rv 0 16) (count 16))
	(st 10))



(clone
(step-gen
	(index (list a sil b sil c sil d sil e sil f sil g sil) (count 16))
	(st 1)
	:pan (rvfi -1 1))
1)
	