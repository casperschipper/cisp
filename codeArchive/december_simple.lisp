(fun x
	(line (seq (rv 0 128) 128) (ch 3 5 7)))

(midi-note-channel
	(/ (st 1) (line (seq 1.0 (rv 1 50)) (st 3)))
	(q (rv x x) (t (seq 1 2 3 12) (rv 0 10)))
	(/ x 80)
	(rv x x)
	(st 1))