(fun a
	(line (seq 30 128) (seq .1 .2)))

(midi-note-channel-trigger
	(+ (st 36) (ch 0 -12 24 0))
	(seq 0.1)
	(seq 100 a a 100 a a)
	(st 8)
	(seq 1))