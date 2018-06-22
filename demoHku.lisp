(sci2
 ping
(line (seq 0.001 0.1) (st 3.5))
:freq 
(+ (seq 1000 2000 3000 4000) 
	(hold (seq 100 200 50 -50) 
		(seq 1 1 1 1 1 1 2)))
:duration (st 0.1)
)