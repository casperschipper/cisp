(# tab1
	(1. 2. 5. 11. 23. 55. 101. 222. 444. 515.))

(step-gen
(seq -1 1)
(index tab1 (line 
	(seq 0 (table-cap tab1))
	(t 
		(ch 0.001 0.2 0.3 0.4 0.5)
		(ch 0.001 0.2 0.3 0.4 0.5)))))