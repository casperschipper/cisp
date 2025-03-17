
(~ a 
	(line (seq 0.01 0.1 0.2) (ch 11 12 12)))



(step-gen
	(bounded-walk -1 1
		(bounded-walk (* -1 (~ a)) (~ a)
			(index-lin 
			(fillf 1024 -0.001 0.001)
			(line (seq 0 1024) (ch 0.1 0.2 0.3))
		)))
	(st 1)
	:pan (rvfi -1 1)
	)