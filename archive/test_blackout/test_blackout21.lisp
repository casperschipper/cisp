(midi-note-channel-trigger
	(list-walk (60 64 65 67 69 72) (ch -1 1))
	(seq 1.0 0.1 0.01 0.01)
	(st 64)
	(reset (walk 0 (st 1)) (st 0) (st 8))
	(seq 1 1 1 0 1 1 1 0 1 1 0 1))

(midi-note-channel-trigger
	(reset (walk 84 (ch -7)) (st 84) (ch 2 3 5 8))
	(seq 1.0 2.0 3.0)
	(st 64)
	(reset (walk 0 (st 1)) (st 0) (st 8))
	(seq 0 1 1 1 0 1 0 1 0 0 1 0))

(midi-note-channel-trigger
	(reset (walk 60 (ch 0 5)) (st 60) (st 5))
	(seq 1.0 0.1 0.01 0.01)
	(st 64)
	(reset (walk 0 (ch 3 1 2)) (st 0) (st 8))
	(seq 1 1 1 1 0))
