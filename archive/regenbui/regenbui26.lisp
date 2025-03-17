(fun a 
	(line (seq 0 10000) (st 30)))

(midi-note-channel-multi
(walk 0 (ch -12 12))
(rv 0.01 0.8)
(st 70)
(rv 1 16)
(ch 0 0 0 0 0 00 0 0 00 0 00 00 0 00 1)
(st 2)
)