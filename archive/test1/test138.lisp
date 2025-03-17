(# tab1 (collect (cycle (st 440)) 44100))






(clone 
(step-gen
	(seq tab1)
	(st 1)
	:pan (rvfi -1 1)
	)
1)