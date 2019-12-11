(# t1 (100. 200 300 400 500 600 1000 1200 2400 4800 9600 12000))
(# t2 (1. 2 3 4 5 0.5 0.1))


(fun a
	(line
		(seq -1 1)
		(ch .1 .3 3 5)))

(fun b
	(/ 1
		(line
			(ch 1 10000)
			(ch .3 .7 1.1))))



(fun freq
	(mup-mod-index (line (seq a a) b)
		t1 t2))

(step-gen
(line (seq -1 1) (/ 1.0 freq))
(st 1)
:pan (rvfi -1 1))

/* first start */