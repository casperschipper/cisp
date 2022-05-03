(fun c
	(t
		(ch 172 1 40 181 172)
		(ch .1 .5 .2)))

(fun b
	(t
		(rv c 172)
		(seq .3 .7 .4)))

(clone
(step-pan-gen
	(loop 
		(seq
		(loop (* (rv -1 1) (seq (fillf 10 -1 1) true)) (ch 16 4 15 32 12 22) (ch 20 44 235 1025 8 4))
		(latch (st 1) (rv 180 b)))
		(rv 1 10)
		(exprv 10 5000 1.0))
	(st 1)
	(line (seq -1 1) (ch 0.001 0.2 0.1 7 13 4 2))
		) 4)