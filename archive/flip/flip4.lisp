(midi-note-channel-multi
	(walk 60 (hold (seq -5 5) (seq 1 2 11 1 1 1 1 1 2 12)))
	(st 0.1)
	(st 64)
	(st 1)
	(flip OSC.table8 0
		(hold (seq 1 1 1 0 1 1 0 1 0 1 1 0) (seq (latch (st 1) (st 24)) (latch (st 2) (st 1)))))
	(st 1))


(midi-note-channel-multi
	(st 72)
	(st 0.1)
	(st 64)
	(st 2)
	(st 1)
	(st 1))










