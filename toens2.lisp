(fun a
	(line
		(seq 0.1 0.3)
		(seq 3 7 5)))

(midi-note-channel
(/ (st 0.25) 3)
(loop (reset (walk 40 (seq 3 4)) 
	(reset (walk 40 (seq 3 4 2 1)) (st 40) (rv 0 12))
	(seq 3 5 7)) (st 3) (st 2))
(line (seq 0.1 3.0) (seq 7 5))
(st 60)
(st 1))