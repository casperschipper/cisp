(# t1 (100. 200 300 400 500 600 1000 1200 2400 4800 9600 12000))
(# t2 (1. 2 0.5 3 1.1 3.4))


(fun a
	(line
		(seq -1 1)
		(ch .1 .3 3)))

(~ b
	(/ 1
		(line
			(ch 1 10)
			(ch 3 7 11))))


(~ pwrite
	(write t1
		(bounded-mup-walk (st 20) (st 12000) (ch 1.5 0.75))
		(count (table-cap t1))))

(schedule (~ pwrite)
	(st 1))


(fun freq
	(mup-mod-index (line (seq a a) (~ b))
		t1 t2))


(step-pan-gen
(lookup OSC.table1 (line (seq a a ) (/ 1.0 freq)))
(st 1)
(line (seq a a) (~ b)))

/* first start */