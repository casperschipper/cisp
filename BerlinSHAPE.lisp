(fun a
	(list-walk OSC.table2 (list-walk OSC.table2 (sometimes 1 -1 10000) )))

(fun ampy
	(compose
	a
	(latch
		(list-walk OSC.table1 (sometimes 1 -1 100)) 
		(st 128))))

(step-pan-gen
	ampy
	(st 1)
	a)