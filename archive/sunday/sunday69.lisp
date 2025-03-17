(fun a 
	(line (seq 0.01 1.0) (st 10)))

(fun b (line (seq 0.01 1.0) (st 7)))

(midi-note-channel
	(ch 0.1 0.2)
	(seq 70 77 82)
	(st 1.0)
	(st 100)
	(st 1))