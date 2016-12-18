(fun timedValue
	(t (ch 10 50 100 200) (* (ch 1 2 4 8 16) 0.1)))

(fun casper 
	(t
		(boundedWalk 50 1000 (* timedValue (ch -1 1))) 
		(* (ch 1 2 4 8) 0.1)))

(sci ping 
	(seq 0.1 0.1 0.1)
	casper
	(rv 1 2)
	(rv 1 2)
)

(sci ping 
	(seq 0.1 0.1 0.1)
	casper
	(rv 1 2)
	(rv 1 2)
)

(sci ping 
	(seq 0.1 0.1 0.1)
	casper
	(rv 1 2)
	(rv 1 2)
)