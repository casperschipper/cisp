(fun a
	(line 
		(seq 0 (table-cap OSC.table1))
		(ch 3 7)))


(~ x
	(write 
	OSC.table1 (index OSC.table2 (rv a a)) (rv a a))
		)

(schedule (~ x)
	(st 0.01))

(# tab1 (alloc 44100))

(~ writeBuff
	(write tab1 
		(index OSC.table3 (bounded-walk 0 128 (seq OSC.table1)))
		(count (table-cap tab1))))


(schedule (~ writeBuff) (st 0.0001))

(fun offset
	(line
		(seq 0 (table-cap tab1))
		(ch 3 5 7 11)))


(step-pan-gen 
	(index tab1 (loop 
		(+ (ch offset offset offset offset) (count2 (st 50) true))
		(rv 1 12)
		(rv 1 64)))
	(st 1)
	(* 0.5 (+ 1 (index tab1 (+ (ch offset offset offset offset) (count2 (st 50) true))))))


