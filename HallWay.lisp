(# table2
	(fillf 44100 0 0))



(step-gen
	(writeover 
		table2 
		(+ (index-lin table2 (line (ch 5 10 200 5120 0 44100) (ch (hold (ch 0.001 0.02 0.03 3 0.01 0.1) (st 60)) (hold (rv 0.1 0.2) (st 100))))) (* 0.1 (cycle (st 220))))
		(count (table-cap table2)) (st 0.5)
		(st 0.2))
	(st 1)
	:pan 0.5
	)