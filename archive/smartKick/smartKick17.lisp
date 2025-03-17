

(midi-note-channel-trigger
	(reset (walk 60 (ch 4 7)) (st 84) (rv 2 4))
	(seq 1.5)
	(st 64)
	(st 9)
	(seq 1 1))


(fun a
	(line (seq 30 128) (ch .1 .2 .4)))

(midi-note-channel-trigger
	(+ (st 36) (seq 0 4 8))
	(seq 0.1)
	(seq 100 a a 100 a a)
	(st 10)
	(seq 1))
