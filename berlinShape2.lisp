(fun a
	(list-walk OSC.table1 (list-walk OSC.table2 (sometimes 2 -1 10000) )))

(fun ampy
	(compose
	a
	(latch
		(list-walk OSC.table1 (ch -1 1)) 
		(st 128))))

(step-pan-gen
	ampy
	(st 1)
	a)