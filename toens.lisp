(fun a
	(line
		(seq 0.0 0.0)
		(seq 3 7 5)))

(midi-note-channel
(seq (latch a (st 4)) (st 0.25))
(reset (walk 60 (seq 3 (seq 4 4 4 4 7 5))) 
	(reset (walk 60 (seq 3 4 3 (seq 4  7) 3 4 3 4 3 4 3 4 5)) (st 60) (rv 0 4))
	(seq 3 5 7))
(st 0.25)
(st 60)
(st 1))