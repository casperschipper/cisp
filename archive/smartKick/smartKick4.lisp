(fun a
	(line (seq 30 128) (seq .1 .2 )))

(midi-note-channel-trigger
	(st 36)
	(seq 0.01)
	(seq a a a)
	(st 8)
	(seq 1))