(fun myPulse
	(seq 
		(latch (hold (rv -1 1) (rv 1 1)) (rv 1 100))
		(latch (st 0) (rv 1 1000)))
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
		(bounded-walk -1.0 1.0 (ch (* -1.0 (~ topspeed)) (~ topspeed)))))


(clone
(step-gen
	(index-lin table1 indexer)
	(st 1)
	:pan (rvi 0 1))
7)

