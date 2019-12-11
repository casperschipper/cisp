(fun stepper 
	(seq 
		(latch (seq -3 -4) (seq 3 5))
		(seq 12 7)))

(midi-note-ctrl
	(st 0.12)
	(+ (reset (walk 0 stepper) (st 0) (st 8)) 60)
	(st 0.12)
	(seq 80 70)
	1
	(st 100)
	)

