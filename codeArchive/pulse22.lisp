(fun myPulse
	(seq 
		(latch (hold (rv -1 1) (rv 1 1)) (rv 1 100))
		(latch (st 0) (rv 1 2)))
	)

(# table1 
	(collect
		myPulse
		256))

(~ topspeed
	(line
		(/
			(st 1.0)
			(ch 1 3000))
		(rv 0 4)))

(fun indexer
	(bounded-walk 0 256
		(bounded-walk -3 3 (ch (* -1.0 (~ topspeed)) (~ topspeed)))))


(clone
(step-gen
	(index-lin table1 indexer)
	(st 1)
	:pan (rvi 0 1))
5)

