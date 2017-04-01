(fun seventh (hold (seq 7 0 5 9 4 0 0 7) (rv 15 30)))

(fun looper (loop (ch 1 2 4 8) (ch 2 3 4 5) (ch 2 3 4)))

(midi-note
	(seq .12 .10)
	(loop (+ 64 (seq -24 -12 seventh 12 24 36)) looper (ch 2 3))
	(st .25)
	(st 100)
	)


(midi-note
	(seq .12 .10)
	(loop (+ 64 (seq -24 -12 seventh 12 24 36)) looper (ch 2 3))
	(st .25)
	(st 100)
	)

(midi-note
	(seq .12 .10)
	(loop (+ 64 (seq -24 -12 seventh 12 24 36)) looper (ch 2 3))
	(st .25)
	(st 100)
	)

(midi-note
	(seq .12 .10)
	(loop (+ 64 (seq -24 -12 seventh 12 24 36)) looper (ch 2 3))
	(st .25)
	(st 100)
	)