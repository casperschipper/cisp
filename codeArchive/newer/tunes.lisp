(fun a 
	(line (seq 40 100) (ch 3 4 7)))

(midi-note-channel-multi 
(walk 100 (ch -7 0))
(st 1.0)
(seq 100 a a a )
(seq 1)
(seq 1 (latch (st 0)) (rv 5 6))
(seq 1)
)