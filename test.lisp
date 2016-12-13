(fun timedValue
	(t (ch 10 50 100 200) (ch casper 2 4 8)))

(fun 
	casper 
	(t
		(boundedWalk 50 1000 (* timedValue (ch -1 1))) 
		(ch 1 2 4 8) ))

(sci ping 
	(seq 0.13 0.1 0.1)
	(index (list casper casper casper) (boundedWalk 0 5 (t (ch -1 1) 30)))
	(rv 1 2)
	(rv 1 2)
)
