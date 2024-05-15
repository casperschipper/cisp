(step-pan-gen
(write OSC.table9
	(hold
	 (list-walk OSC.table9 (ch -1 1)) (ch 1 2 3))
	(hold (count (table-cap OSC.table1)) (sometimes 1 1000 100000)))
(st 1)
(hold (seq OSC.table9) (rv 1 1000))
)

/* first start */