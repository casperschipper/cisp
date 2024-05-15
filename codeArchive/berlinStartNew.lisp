(# t1 (100. 200 300 400 500 600 1000 1200 2400 4800 9600 12000))
(# t2 (1. 2 3 4 5 0.5 0.1))


(fun a
	(line
		(rv -1 1)
		(ch .1 .3 3 5)))

(fun b
	(/ 1
		(line
			(rf 1 120)
			(ch .3 .7 1.1))))



(fun freq
	(mup-mod-index (line (seq a a) b)
		t1 t2))

(step-gen
(index OSC.table1 (* (hzPhasor freq) 128))
(st 1)
:pan (rvfi -1 1))

/* first start */