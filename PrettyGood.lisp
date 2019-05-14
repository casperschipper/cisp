(# table1 (fillf 8 -1 1))
(# table2 (fillf 8 1 10))

(fun top
	(line
		(ch 1 3 1 4 8 100 200)
		(ch 0.1 0.01 1 2)))


(fun updateSpeed
	(line
		(ch 0.01 0.1 0.1 0.5 0.001)
		(t (ch .5 0.75 0.01) (ch 1 3 0.1))))


(~ writer
	(write table1 (rv -1 1) (count (table-cap table1))))

(~ writer2
	(write table2 (rv 1 top) (count (table-cap table2))))

(schedule
	(seq (~ writer) (~ writer2))
	updateSpeed)


(step-pan-gen
	(seq table1)
	(list-walk table2)
	(hold (list-walk table1) (weights ((1 10000) (1000 1)))))