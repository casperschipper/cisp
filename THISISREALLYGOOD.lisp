(# m1 (alloc 20))
(# m2 (alloc 20))

(fun idx
	(count 128))

(fun makeIndex (arg)
	(* (+ arg 1) (table-cap OSC.table1)))

(fun top
	(st 0))

(fun addDev (dev)
	(+ dev (rv 0.0 top)))

(~ readPos
	(line
		(seq 0 128)
		(st 0.01)))

(step-pan-gen
	(write 
		m1 
		(index-lin OSC.table1 (addDev (makeIndex (index m1 (~ readPos))))) 
		(+ (~ readPos) 1))
	(st 1)
	(write 
		m2 
		(index-lin OSC.table1 (addDev (makeIndex (index m2 (~ readPos)))))
		(+ (~ readPos) 1)))