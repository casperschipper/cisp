(fun a
	(line 
		(seq 0 (table-cap OSC.table1))
		(ch 0.1 0.5 1.0 1.5)))


(~ x
	(write 
	OSC.table1 (index OSC.table2 (rv a a)) (rv a a))
		)

(schedule (~ x)
	(st 0.001))


(step-pan-gen 
	(bounded-list-walk a a OSC.table3 (seq OSC.table1))
	(st 1)
	(bounded-list-walk a a OSC.table3 (seq OSC.table1)))