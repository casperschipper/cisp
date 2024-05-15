(fun myPulse
	(seq 
		(latch (hold (rv -1 1) (rf 1 3)) (rf 1 10))
		(latch (st 0) (rv 1 50)))
	)

(# table1 
	(collect
		myPulse
		16))

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
(pulse-gen
	(index-lin table1 indexer)
	(st 1)
	:pan (rvi 0 1))
4)

