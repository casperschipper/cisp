(fun a 
	(hold (seq 127 80 40) (ch 1 1 1 1 3)))

(fun b
	(hold (seq 128 10 5 80 80) (ch 1 1 1 1 1 1 1 1 1 1 2))) 

(midi-note-channel-sync
	(st 36)
	(st 0.1)
	(seq a a b)
	(st 1))

(midi-note-channel-sync
	(seq 38)
	(st 0.1)
	(seq b b a)
	(st 2))

(midi-note-channel-sync
	(seq 42 44 38)
	(st 0.1)
	(seq b b b)
	(st 3))


/* nice and interesting to layer */	