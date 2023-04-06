(# t1 (fillf 32 100 16000))
(# t2 (fillf 32 0.1 3.0))


(fun a
	(line
		(seq -1 1)
		(ch .1 .3 3 5)))

(fun b
	(/ 1
		(line
			(ch 100 10000)
			(ch .3 .7 1.1))))



(fun freq
	(mup-mod-index (line (seq a a) b)
		t1 t2))

(step-gen
(line (seq -1 1) (/ 1.0 freq))
(st 1)
:pan (rvfi -1 1))

/* first start */