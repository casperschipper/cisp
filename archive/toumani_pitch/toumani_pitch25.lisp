(fun a 
	(hold 
	(ch 12 4 5 7)
	(ch 3 5 6 12)))

(~ pitch (seq
	(seq 60 60 (walk 74 (ch -12 -7 7 12)))
	(seq 67 67 67)
	(seq 72 72 (walk 74 (ch -12 -7 7 12)))))