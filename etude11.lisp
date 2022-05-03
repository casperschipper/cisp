
(clone
(step-gen
	(index-lin 
		(sine 512 (fillf 512 -1 1))
	
		(bounded-walk (st 0) (st 512) (line (seq 2.99 3.01 3.0 3.0) (ch 3 2 4))))
			
	(t (ch 1 2 3 4) (rv 10 15))
	:pan (rvfi -1 1))
8)

