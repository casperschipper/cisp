(sync 0.15)

(midi-note-channel
	(st 0.15)
	(+ (seq 36 38) (list-walk (0 0 0) (hold (seq 1 -1) (ch 1 2 5) )))
	(st 0.1)
	(seq 30 40 100 90)
	(st 2))

(midi-note-channel
	(st 0.15)
	(list-walk (50 54 62 74) (ch -1 1))
	(st 0.1)
	(st 100)
	(st 1))