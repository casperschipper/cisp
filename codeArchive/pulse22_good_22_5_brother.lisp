(fun myPulse
	(seq 
		(latch (hold (rv -1 1) (rf 1 3)) (rf 1 10))
		(latch (st 0) (rv 1 50)))
	)

(# table1 
	(collect
		myPulse
		16))

(# recording1
	(fillf 441000 0 0))

(~ topspeed
	(line
		(hold (/
			(st 1.0)
			(rf 10 5000)) (st 2))
		(fractRandTimer (ch 0.01 0.03 0.1 0.5 3.0))))

(fun indexer
	(bounded-walk (st 0) (table-cap table1)
		(bounded-walk -10.0 10.0 (ch (* -1.0 (~ topspeed)) (~ topspeed)))))


(clone
(step-gen
	(write recording1 (index-lin table1 indexer) (count (table-cap recording1)))
	(st 1)
	:pan (rvi 0 1))
1)


(clone 
(step-gen
	(index-lin recording1 
		(bounded-walk (st 0) (table-cap recording1) 
			(t 
				(bounded-mup-walk (st 0.5) (st 8.0) (ch 0.75 1.5))
				(t (ch 1 0.5 0.25) (ch 3 6 11 23)))))
	(st 1)
	:pan (rvi 0 1))
3)