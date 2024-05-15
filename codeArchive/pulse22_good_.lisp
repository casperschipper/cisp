(fun myPulse
	(seq 
		(latch (hold (rv -1 1) (rv 1 1)) (rv 1 100))
		(latch (st 0) (rv 1 10)))
	)

(# table1 
	(collect
		myPulse
		4096))

(~ topspeed
	(line
		(/
			(st 1.0)
			(ch 100 20000 300000))
		(ch 3.0)))

(fun indexer
	(bounded-walk 0 4096
		(bounded-walk -10.0 10.0 (ch (* -1.0 (~ topspeed)) (~ topspeed)))))


(clone
(step-gen
	(index-lin table1 (* indexer (line (rv 0.001 1.0) (ch 0.1 0.3 0.5 1.0 2.0))))
	(st 1)
	:pan (rvi 0 1))
5)

