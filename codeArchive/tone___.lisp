(# table0 (fillf 512 0 0 ))




(~ fish 
	(write table0  (walk 0 (rv -0.01 0.01)) (bounded-walk 0 512 (st 1))))

(samp-schedule 
    (~ fish)
	(t (rv 1 1000) (rv 0 1)))

(clone 

	(step-gen
	(index-lin table0 
		(walk 0 (t 
			(+	
				(bounded-mup-walk 4.0 8.0 (ch 0.5 1.5 0.75 2.0)) 
				(line (seq 0 0.1) (ch 0.01 10.0)))
				(ch 3 4 7))))
				
	
	(st 3)
	:pan (rvfi -1 1))
	10)
