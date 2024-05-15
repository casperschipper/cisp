(fun myPulse
	(seq 
		(latch (ch (fillf 999 -1 1)) (st 1))
		(latch (st 0) (rv 0 10)))
	)

(print (collect myPulse 1024))

(step-gen
	(index-lin (collect 
		myPulse
		44100)
	(bounded-walk 0 999 (ch -0.01 0.01)))
	(st 1)
	:pan -1)

(step-gen
	(index-lin (collect 
		myPulse
		44100)
	(bounded-walk 0 999 (ch -0.01 0.01)))
	(st 1)
	:pan 0.0)

(step-gen
	(index-lin (collect 
		myPulse
		44100)
	(bounded-walk 0 999 (ch -0.01 0.01)))
	(st 1)
	:pan 1.0)