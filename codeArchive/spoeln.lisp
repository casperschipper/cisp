(fun a
	(line
		(seq 0.1 0.3)
		(seq 3 7 5)))

(fun b
	(line
		(seq 100 0)
		(ch 3 7 11)))

(midi-note-channel
(/ (st 0.25) 3)
(loop (reset (walk 40 (seq 3 4)) 
	(reset (walk 40 (seq 3 4 2 1)) (st 40) (rv 0 12))
	(seq 3 5 7)) (st 3) (st 2))
(line (seq 0.1 3.0) (seq 7 5))
(seq b b b)
(st 1))