(fun a 
	(line (seq 0.01 1.0) (st 10)))

(fun b (line (seq 0.01 1.0) (st 7)))

(midi-note-channel
	(st 0.2)
	(+ 
		(seq 
			(hold (reset (walk 0 (ch -2 0 7)) (st 0) (st 5)) (st 5)) 4 
			(hold (reset (walk 7 (ch -2 0 7)) (st 7) (rv 4 5)) (seq 2 3))
			(hold (reset (walk 7 (ch -2 0 7)) (st 7) (rv 4 5)) (seq 2 3))
		) 72)
	(line (seq 0.01 0.5) (ch 3 5 7))
	(st 100)
	(st 1)	
)