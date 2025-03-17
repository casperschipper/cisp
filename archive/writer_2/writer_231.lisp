(# tab1 (fillf 512 -1 1))

(# tab2 (fillf 512 -1 1))

(fun writer 
	(write tab1 
		(* 0.499999 (+
			(
				(index tab1 (count (table-cap tab1)))
				(index tab1 (+ 1 (count (table-cap tab1))))
			)
			))
		(+ 510 (count (table-cap tab1)))))

(samp-schedule
	writer
	(st 1))

(step-gen
	(list-walk tab1 (ch -1 1))
	(st 1)
	)