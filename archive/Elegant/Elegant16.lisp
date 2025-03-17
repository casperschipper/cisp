(# tabl
	(60. 62 67 74 70 65))


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



(samp-schedule
	update
	(* (ch 0.1 0.5 1.0 2.0 4.0) 44100))


(midi-note-channel
	(st 0.14)
	(seq tabl)
	(st 0.5)
	(st 100)
	(st 1))