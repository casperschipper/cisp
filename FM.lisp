(fun freq2
(index-lin
	OSC.table3
	(line (rv 0 128) (ch 1 2 4 8))))

(clone
(step-gen
(index-lin 
	OSC.table1 
	(bounded-walk (st 0) (st 128)
	 (* (index-lin OSC.table2 (bounded-walk 0 128 freq2)) (hold (* (seq OSC.table4) 100) (ch 1 2 4)))))
(st 1)
:pan (rvfi -1 1)) 2)
