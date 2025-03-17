(# tab1 (60. 65 70 75 80 85))

(samp-schedule
	(write tab1 
		(reset 
			(walk 50 (ch -5 5 -7 7))
			(st 50)
			(rv 11 15))
		(t (seq 0 1 2) (ch 3 6 8)))
	(ch 1000 2000 3000 50000))

(fun a 
	(t 
		(ch 40 50 100 110 120 128)
		(ch 3 5 7 11)))

(fun third
	(index
		(
			(seq 0 1 2)
			(ch 3 4 5)
			(ch 2 5)
			(rv 0 5)
			(hold (rv 0 5) (rv 0 4))
		)
	(t (ch 0 1 2 3 4) (ch 3 5 7 11)))
)

(midi-note-channel
	(st 0.5)
	(index tab1 (seq 0 1 third))
	(st 1.5)
	(seq a a a)
	(st 1))