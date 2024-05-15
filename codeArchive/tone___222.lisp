(# table0 (fillf 512 0 0 ))




(~ fish 
	(write table0  (bounded-walk -0.2 0.2 (hold (ch -0.01 0.01) (ch 1 2 10))) (bounded-walk 0 512 (st 1))))

(samp-schedule 
    (~ fish)
	(t (ch 300 1000) (rv 0 3)))

(clone 

	(step-gen
	(index-lin table0 
		(walk 0 (t 
			(+	
				(bounded-mup-walk 1.0 64.0 (ch 0.5 1.0 1.5 0.667 0.9999))
				(line (seq 0 0.001) (ch 0.01 10.0)))
				(ch 3 4 7))))
				
	
	(st 2)
	:pan (rvfi -1 1))
	1)
