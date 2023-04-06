(fun four
	(hold 
	(seq 40 80 100)
	(st 4)
	))

(fun two
	(hold 
	(seq 20 120)
	(st 7)
	))

(midi-note-channel-sync
	(list-walk (36 42 43) (st 1))
	(st 0.1)
	(seq 100 two 70 four)
	(st 1))


/* nice and interesting to layer */	