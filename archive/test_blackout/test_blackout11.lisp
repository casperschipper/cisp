(midi-note-channel-trigger
	(seq 60 64)
	(st 0.1)
	(st 64)
	(reset (walk 0 (st 1)) (st 0) (st 8))
	(seq 1 1 1 0 1 1 1 0 1 1 0 1))

(midi-note-channel-trigger
	(seq 72 84)
	(st 0.1)
	(st 64)
	(reset (walk 0 (st 1)) (st 0) (st 8))
	(seq 0 1 1 1 0 1 0 1 0 0 1 0))
