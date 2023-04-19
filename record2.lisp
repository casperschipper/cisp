(# tab1 (fillf 44100 0 0))

(samp-schedule 
	(write tab1 
		(audioIn (st 0))
	(count (table-cap tab1)))
	(st 1))

(step-gen
	(seq tab1)
	(st 1))