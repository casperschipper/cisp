(# table0 (fillf 512 0 0 ))


(fun top
	(t
		(ch 0.01 0.1 0.2 0.3 1.0)
		(ch 0.3 0.5 1.0 2.0 4.0)))


(samp-schedule 
    (write table0  (bounded-walk -0.2 0.2 (hold (ch -0.01 top) (ch 1 2))) (count 512))
	(t (ch 1 2 3 100 1000 4000 50000) (rv 0 1)))

(clone 

	(step-gen
	(index-lin table0 
		(walk 0 (t 
			(+	
				(bounded-mup-walk 1.0 8.0 (ch 0.999999 0.6666 2 1.0 2.0 1.001)) 
				(line (seq 0 0.1) (ch 0.01 10.0)))
				(t 
					(ch 0.1 0.2 0.4 0.8 1.6 3.2 6.4)
					(ch  0.8 1.6 3.2 6.4)))))
				
	
	(st 3)
	:pan (rvfi -1 1))
	3)
