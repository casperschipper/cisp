(fun cycle
	(line
		(seq 120 30 0 80 30)
		(ch 0 1 2 3)))

(midi-note
(st 0.12)
(st 36)
(st 0.12)
(seq cycle cycle cycle cycle))

(midi-note
	(st 0.12)
	(st 38)
	(st 0.12)
	(seq cycle cycle cycle cycle :set 0))
