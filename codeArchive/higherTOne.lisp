(line-pan-gen
	(seq (fillf 16384 -1 1) :max 
		(index
			(list 
				(line (seq 128 132) (ch 1 2 33 37))
				(st 2)
			) (t (rv 0 2) (ch 1 3 4 0.01)))
		)
	(st 2)
	(st (rvfi -1 1)))