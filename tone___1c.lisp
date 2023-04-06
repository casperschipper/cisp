(# table0 (fillf 512 0 0 ))




(~ fish 
	(write table0  (bounded-walk -0.2 0.2 (hold (rv -0.001 0.001) (ch 1 200))) (bounded-walk 0 512 (st 1))))

(samp-schedule 
    (~ fish)
	(t (rv 20 4000) (rv 0 0.1)))

(clone 

	(step-gen
	(index-lin table0 
		(walk 0.0 (t 
			(+	
				(line (hold (reset (bounded-mup-walk 1.0 2.0 (ch 0.6666667 1.0 1.5)) (st 1.0) (st 4)) (st 2)) (seq 0.5))
				(line (rv 0 0.01) (rv 0.01 10.0)))
				(ch 3 3.5 4.5 4 7))))
				
	
	(st 3)
	:pan (rvfi -1 1))
	10)
