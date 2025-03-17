(midi-note-channel-multi
	(seq 60 64 72)
	(st 0.1)
	(st 64)
	(st 1)
	(monitor (flip OSC.table8 0
		(hold (seq 1 1 1 0 1 1 0 1 0 1 1 0) (seq (latch (st 1) (st 24)) (latch (st 2) (st 1))))))
	(st 1))


(midi-note-channel-multi
	(st 72)
	(st 0.1)
	(st 64)
	(st 1)
	(st 1)
	(st 1))










