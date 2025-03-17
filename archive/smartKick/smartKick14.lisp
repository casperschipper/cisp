(fun a
	(line (seq 30 128) (ch .1 .2 .4)))

(midi-note-channel-trigger
	(+ (st 36) (seq 0 4 8))
	(seq 0.1)
	(seq 100 a a 100 a a)
	(st 8)
	(seq 1))