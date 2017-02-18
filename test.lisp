(fun rep 
	(seq (ch 1 2) 5 4 9 1 2 3))
(fun rep2
	(seq (ch 1 2) 5 4 9 1 2))
(fun rep3
	(seq (ch 1 2) 5 4 9 1 3))

(fun panLine (line (seq -1 1) (ch 1 2 4 8)))

(fun foo 
	(mtof 
		(+ 
			(seq 
				(hold (seq 0 2 -2 4 7) rep) 
				(hold (seq 4 7 9 12 5) rep2) 
				(hold (seq 7 4 2 9 5) rep3)) 
			60)))

(sci saw 0.1 foo 0.2 0.1 panLine)
(sci saw 0.1 foo 0.2 0.1 panLine)
(sci saw 0.1 foo 0.2 0.1 panLine)
(sci saw 0.1 foo 0.2 0.1 panLine)
(sci saw 0.1 foo 0.2 0.1 panLine)
(sci saw 0.1 foo 0.2 0.1 panLine)





