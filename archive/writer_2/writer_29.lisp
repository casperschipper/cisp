(# tab1 (fillf 512 -1 1))

(# tab2 (fillf 512 -1 1))


(samp-schedule
	(write tab1 
		(* 0.5 (+
			(
				(index tab1 (count (table-cap tab1)))
				(index tab1 (+ 1 (count (table-cap tab1))))
			)
			))
		(+ 64 (count (table-cap tab1))))
	(st 1))

(step-pan-gen
	(seq tab1)
	(st 1)
	(seq tab2))