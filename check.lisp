(fun freq
	(hold
		(list-walk (50 100 200 300 500 700) (st 1))
		(seq 1 1 1 1 1 1 2)))
	


(clone
(line-gen
(seq -1 1)
(t
	freq	
	(hold (ch 0.05 0.1 0.2 0.4) (rv 8 16))))
5)