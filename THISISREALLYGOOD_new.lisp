(# m1 (alloc 1))

(fun scale (arg)
	(* (+ 1 arg) 64))

(step-gen
	(write 
		m1
		(bounded-walk (st -1) (st 1) (index-lin OSC.table1 (scale (seq m1))))
		(st 0))
	(st 1))