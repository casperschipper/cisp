(# tabl
	(60. 55 65 70 75))

(# tabl2
	(0.1 0.5 2.0 1.5 4.0))

(# tabl3
	(64. 64. 64 64 64 64))



(~ index
	(t
		(series 0 1 2 3 4 5)
		(ch 3 4 7)))

(sync 0.14)

(fun update 
	(write 
		tabl
		(+ (index tabl (~ index)) (ch -12 10 -12 12))
		(~ index)
		))

(fun update2 
	(write 
		tabl3
		(clip (* (index tabl2 (~ index)) (ch 1. 0.666667)) 0.1 0.5)
		(~ index)
		))

(fun update3
	(write 
		tabl3
		(clip (* (index tabl3 (~ index)) (ch 1.5 0.9 0.666666667 2)) 40 128)
		(~ index)
		))




(samp-schedule
	(seq update update2 update3)
	(* (ch 0.1 0.5 1.0 2.0 4.0) 44100))


(midi-note-channel
	(line (rv 0  8) (ch 3 4 5))
	(seq tabl)
	(seq tabl2)
	(seq tabl3)
	(st 1))