(fun a
	(list-walk OSC.table2 (seq OSC.table2)))

(fun ampy
	(compose
	a
	(seq OSC.table1 true)))

(step-pan-gen
	ampy
	(st 1)
	a)