(midi-note-channel-trigger
	(seq 60 64)
	(st 0.1)
	(st 64)
	(st 1)
	(seq 1 1 1 0 1 1 0 1 0 1 1 0))

(midi-note-channel-trigger
	(seq 72 74)
	(st 0.1)
	(st 64)
	(st 2)
	(seq 0 1 1 1 0 1 1 0 1 0 1 1))

(midi-note-channel-trigger
	(seq 79)
	(seq 0.1 0.3)
	(st 64)
	(st 3)
	(seq 0 1 1 0 1 1 0 1 0 1 1 0 1))

(midi-note-channel-trigger
	(reset (walk 84 (seq -7 -7 -5)) (st 84) (rv 5 8))
	(seq 1.5)
	(st 110)
	(st 4)
	(seq 1 0 0 0 0))