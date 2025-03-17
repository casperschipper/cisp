(fun a 
	(line (seq 0.01 1.0) (st 10)))

(fun b (line (seq 0.01 1.0) (st 7)))

(midi-note-channel
	(ch 3 3.5)
	(seq 64 67 72)
	(st 1.0)
	(st 100)
	(st 1))