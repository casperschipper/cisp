(midi-note-channel
	(st 0.25)
	(+ (seq 72 73 72 70) (hold (seq 0 7) (st 3)))
	(st 1.0)
	(index (list 60. 80.)
		(seq 1 0 1 1 (latch (st 1) (seq 0 2))))
	(st 1))

(midi-note-channel
	(st 0.25)
	(hold (seq 55 60 65 72 74 79) (seq 5 7 3))
	(st 1.0)
	(seq 80.)
	(st 1))

(midi-note-channel
	(st 0.25)
	(+ (seq 60 67 72 79) (hold (seq 0 7) (st 3)))
	(st 1.0)
	(index (list 60. 80.)
		(seq 1 1 (latch (st 0) (seq 0 2))))
	(st 1))

(midi-note-channel
	(st 0.25)
	(+ (+ (seq 48 46) (hold (seq 0 7) (seq 5 5 3 5 5)))
		(hold (seq 0 2 -2) (st 7)))
	(st 1.0)
	(index (list 60. 80.)
		(seq 1 0 1 1 (latch (st 0) (seq 2 2 2 2 1))))
	(st 1))

