

(fun freq
	(seq
		(linseg 
			(ftom (list-walk (list 3 30 1000 100 40 4000) (hold (seq 1 2 33) (seq 13 17))))
			(ftom (list-walk (list 5100. 6000 4900 10 80 10000) (hold (seq 1 2 33) (seq 7 23))))
			(list-walk (grow 3 2 12) (hold (seq 1 2 3300) (seq 1 2 3 77 100))))))

(step-gen
	(cycle (mtof freq))
	(st 1)
	)