(fun a 
	(line (seq 0.01 1.0) (st 10)))

(fun b (line (seq 0.01 1.0) (st 7)))

(midi-note-channel
	(ch 0.1 0.1011)
	(+ 
		(seq 70 77 82) 
		(hold (walk 0 (ch -2 2)) (rv 4 11)))
	(st 1.0)
	(st 100)
	(st 1))