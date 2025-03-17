(# tabl
	(60. 62 67 72 70 68))


(~ index
	(t
		(rv 0 6)
		(ch 3 4 7)))

(fun update 
	(write 
		tabl
		(+ (index tabl (~ index)) (ch -12 12 -5 5))
		(~ index)
		))



(samp-schedule
	update
	(st 10000))


(midi-note-channel
	(st 0.14)
	(seq tabl)
	(st 0.5)
	(st 100)
	(st 1))