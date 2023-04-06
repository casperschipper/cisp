(# table2
	(fillf 4410 0 0))



(step-gen
	(writeover 
		table2 
		(+ (index-lin table2 (line (seq 0 4410) (ch (hold (rv 0.01 0.1) (st 60)) (hold (rv 0.1 0.2) (st 100))))) (* 0.1 (cycle (st 220))))
		(count (table-cap table2)) (st 0.5)
		(st 0.2))
	(st 1)
	:pan 0.5
	)