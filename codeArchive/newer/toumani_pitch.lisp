(fun a 
	(hold 
	(ch 12 4 5 7)
	(ch 3 5 6 12)))

(~ pitch (seq
	(seq 60 60 (reset 
		(walk 74 (ch -12 -7 7 12))
		(st 60) (st 6)))
	(seq 67 67 67)
	(seq 72 72 (reset 
		(walk 74 (ch -12 -7 7 12))
		(st 60) (st 6)))))