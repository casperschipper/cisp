(# tabl
	(60. 62 67 74 70 65))

(# tabl2
	(0.1 0.5 2.0))

(# tabl3
	(100. 40 80))



(~ index
	(t
		(series 0 1 2 3 4 5)
		(ch 3 4 7)))

(fun update 
	(write 
		tabl
		(+ (index tabl (~ index)) (ch -2 2 -5 5))
		(~ index)
		))

(fun update2 
	(write 
		tabl3
		(* (index tabl2 (~ index)) (ch 1.5 0.75))
		(~ index)
		))

(fun update3
	(write 
		tabl3
		(* (index tabl3 (~ index)) (ch 1.5 0.75))
		(~ index)
		))




(samp-schedule
	(seq update update2 update3)
	(* (ch 0.1 0.5 1.0 2.0 4.0) 44100))


(midi-note-channel
	(st 0.14)
	(seq tabl)
	(seq tabl2)
	(seq tabl3)
	(st 1))