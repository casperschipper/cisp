()

(fun freq
	(seq
		(linseg 
			(list-walk (list 3 30 1000 100 40 4000) (hold (seq 1 2 33300) (seq 13 17)))
			(list-walk (list 5100. 6000 4900 10 80 10000) (hold (seq 1 2 3300) (seq 7 23)))
			(list-walk (grow 1 2 12) (hold (seq 1 2 3300) (seq 31 39))))))

(step-gen
	(cycle freq)
	(st 1))