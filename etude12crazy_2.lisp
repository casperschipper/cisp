(fun target
	(mtof 
		(line
			(seq -300 200)
			(st 7))))

(fun 
	holder
	(line
		(seq 1 target)
		(ch 0.4 1.0 3.0)))


(fun 
	stepsize
	(line
		(hold (ch (rv 1 10000)) (st 2))
		(ch 0.1 0.5 0.7 1.4 2.8 5.6)))

(clone
(line-pan-gen
	(list-walk OSC.table1 (hold (ch (* -1 stepsize) stepsize) holder))
	(st 1)
	(line 
		(list-walk OSC.table1 (hold (ch (* -1 stepsize) stepsize) holder))
	 (st 0.3)))
2)

(clone
(line-pan-gen
	(list-walk OSC.table2 (hold (ch (* -1 stepsize) stepsize) holder))
	(st 3)
	(line 
		(list-walk OSC.table2 (hold (ch (* -1 stepsize) stepsize) holder))
	 (st 0.3)))
2)

(clone
(line-pan-gen
	(list-walk OSC.table3 (hold (ch (* -1 stepsize) stepsize) holder))
	(st 10)
	(line 
		(list-walk OSC.table3 (hold (ch (* -1 stepsize) stepsize) holder))
	 (st 0.3)))
2)