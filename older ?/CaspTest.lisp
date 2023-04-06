(seq 10 
	(index 
		(list (rv 10 20) 2 3) (count 2)) 
		(index (list (rv 1 10) 12 13) (count 3))  
		(rv 0 100) (line (rv -1 1) 
			(ch 1 2 4)))

(+ 
	(seq 10 11 12 (rv 1 10) (rv 10 100))
	(ch 10 100 100)
)