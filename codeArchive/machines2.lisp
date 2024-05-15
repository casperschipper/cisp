(# tab1 (0.001 0.0002 0.01 0.02 0.3 3 60))

(# tab2 (40. 50 60 100 10 20 25. 17))

(fun a 
	(line
		(seq 0 (table-cap tab1))
		(ch tab1)))

(fun a2
	(line
		(seq 0 (table-cap tab2))
		(ch tab1)))

(fun one
	(line
		(seq 0 1 .1 0 -1)
		(seq 1 3 1 2)))

(fun l
	(line
		(seq -1 one)
		(index tab1 a)))

(fun holder
	(t 
		(seq tab2)
		(ch 1 3 5)))

(step-pan-gen
	(hold (seq l l l l l l l l l l) holder)
	(st 1)
	l)N