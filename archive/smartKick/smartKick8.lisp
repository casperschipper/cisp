(fun a
	(line (seq 30 128) (seq .1 .2)))

(midi-note-channel-trigger
	(+ (st 36) (ch 0 12 24))
	(seq 0.04)
	(seq 100 a a 100 a a)
	(st 8)
	(seq 1))