(fun myPulse
	(seq 
		(latch (hold (rv -1 1) (rv 1 1)) (rv 1 100))
		(latch (st 0) (rv 1 500)))
	)

(# table1 
	(collect
		myPulse
		128))

(~ topspeed
	(line
		(hold (/
			(st 1.0)
			(ch 100 10 20000 30000000)) (st 2))
		(fractRandTimer (ch 0.01 0.03 0.1 0.5 3.0))))

(fun indexer
	(bounded-walk (st 0) (table-cap table1)
		(bounded-walk -3.0 3.0 (ch (* -1.0 (~ topspeed)) (~ topspeed)))))


(clone
(step-gen
	(index-lin table1 indexer)
	(st 1)
	:pan (rvi 0 1))
4)

