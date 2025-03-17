(fun a 
	(line (seq 0 10000) (st 30)))

(midi-note-channel-multi
(walk 0 (ch -12 12))
(rv 0.01 0.8)
(st 70)
(rv 1 16)
(weights (((st 1) 100) (0 a)))
(st 2)
)