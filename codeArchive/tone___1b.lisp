(# table0 (fillf 512 0 0 ))




(~ fish 
	(write table0  (bounded-walk -0.2 0.2 (hold (rv -0.01 0.01) (ch 100 200))) (bounded-walk 0 512 (st 1))))

(samp-schedule 
    (~ fish)
	(t (rv 1 10) (rv 0 1)))

(clone 

	(step-gen
	(index-lin table0 
		(walk 0 (t 
			(+	
				(bounded-mup-walk 4.0 8.0 (ch 0.5 1.5 0.75 2.0)) 
				(line (rv 0 0.01) (rv 0.01 10.0)))
				(ch 3 4 7))))
				
	
	(st 3)
	:pan (rvfi -1 1))
	10)
