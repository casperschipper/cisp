(midi-note-channel-trigger
	(seq 60 64)
	(st 0.1)
	(st 64)
	(st 1)
	(seq 1 1 1 0 1 1 0 1 0 1 1 0))



(midi-note-channel-trigger
	(seq (hold (seq 72 70 68) (rv 5 6)) 74)
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

(fun level
	(line 
		(seq 30 110)
		(ch 3 5 7)))

(midi-note-channel-trigger
	(reset (walk 84 (seq -7 -7 -5)) (st 84) (rv 5 8))
	(seq 1.5)
	level
	(st 4)
	(seq 1 0 0 0 0))

(midi-note-channel-trigger
	(reset (walk 84 (seq -7 -7 -5)) (st 84) (rv 5 8))
	(seq 1.5)
	level
	(st 5)
	(seq 0 0 1 0 0))


(midi-note-channel-trigger
	(reset (walk 84 (ch -7 -7 -5)) (st 84) (rv 5 8))
	(seq 1.5)
	level
	(st 6)
	(seq 0 1 0 1 0))


(midi-note-channel-trigger
	(reset (walk 60 (ch 4 7)) (st 84) (rv 2 4))
	(seq 1.5)
	(st 64)
	(st 7)
	(seq 1 1))

(midi-note-channel-trigger
	(+ (seq 82 84) (walk 0 (ch 0 0 0 0 0 0 0 0 0 1)))
	(seq 1.5)
	(seq (latch (st 0) (st 44))
		(latch (st 90) (st 60)))
	(st 8)
	(seq 1 1))

