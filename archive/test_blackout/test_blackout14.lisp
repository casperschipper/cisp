(midi-note-channel-trigger
	(seq 60 64)
	(st 0.1)
	(st 64)
	(reset (walk 0 (st 1)) (st 0) (st 8))
	(seq 1 1 1 0 1 1 1 0 1 1 0 1))

(midi-note-channel-trigger
	(seq 72 79)
	(st 0.1)
	(st 64)
	(reset (walk 0 (st 1)) (st 0) (st 8))
	(seq 0 1 1 1 0 1 0 1 0 0 1 0))

(midi-note-channel-trigger
	(reset (walk 60 (ch 0 5)) (st 60) (st 5))
	(st 0.1)
	(st 64)
	(reset (walk 0 (ch 3 1 2)) (st 0) (st 8))
	(seq 1 1 1 1 0))
