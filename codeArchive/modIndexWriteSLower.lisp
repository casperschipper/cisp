(# t1 (100. 200 300 400 500 600 1000 1200 2400 4800 9600 12000))
(# t2 (1. 2 0.5 3 1.1 3.4))


(fun a
	(line
		(seq -1 1)
		(ch .1 .6 .99)))

(~ b
	(/ 1
		(line
			(ch .2 10)
			(ch 3 7 11))))


(~ pwrite
	(write t1
		(bounded-mup-walk (st 50) (st 12000) (ch 1.5 0.75))
		(count (table-cap t1))))

(schedule (~ pwrite)
	(st 1))


(fun freq
	(mup-mod-index (line (seq a a) (~ b))
		t1 t2))

(fun slow
	(t
		freq
			(t
				(seq 0.1 0.001 0.2 0.4)
				(ch 1 3 5))))


(step-pan-gen
(write OSC.table1 (lookup OSC.table1 (line (seq -1 1 ) (/ 1.0 freq))) (hold (count (table-cap OSC.table1)) (sometimes 100 1000 1)))
(st 1)

(hold (line (seq a a) (~ b)) (sometimes 1 1000 10000))

)

/* first start */