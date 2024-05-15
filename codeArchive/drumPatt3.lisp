(fun one
	(latch (st 1) (st 10)))

(fun two
	(latch (st -1) (seq 2 2 2 3)))

(midi-note-channel-sync
	(list-walk (36 38 42 44 38) (seq one two))
	(st 0.1)
	(seq 100 120 10 100)
	(st 3))


/* nice and interesting to layer */	