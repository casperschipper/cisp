

(# list1
	(1. 2 3 4 5 22 33 100))

(fun topper
	(seq 1 100))

(procedure fillList
	(# list1
		(fillf 8 1 14)))

(fun select
	(t
		(ch 0.003 0.01 0.1 0.2 0.3 0.8 4)
		(ch 0.003 0.01 0.1 0.2 0.3 0.8 8)))

(fun top
	(line
		(seq 1 8)
		select))

(fun a
	(line (seq top top) select))

(schedule fillList (st 5))

(pulse-pan-gen
	(seq (fillf 256 -1 1))
	(hold (index list1 a) (weights ((1 10) (10 1))))
	(t (rv -1 1) select))