(fun a 
	(hold 
	(ch 12 4 5 7)
	(ch 3 5 6 12)))

(~ pitch (seq 
	(reset (walk 60 (* a (seq -1 1))) (st 60) (st 9)) 
	(reset (walk 60 (* a (ch -1 1))) (walk 60 (ch -7 7)) (ch 3 5 9))
	(reset (walk 60 (* a (ch -1 1))) (st 60) (st 9))))