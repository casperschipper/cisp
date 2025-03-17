(fun a 
	(line (seq 0.01 0.1) (st 10)))

(fun b (line (seq 0.01 0.2) (st 7)))

(midi-note-channel
	(rv a b)
	(+ 
		(seq 
			(hold (seq 0 2 -2) (st 5)) 4 
			(hold (seq 7 9 12) (seq 2 3))
		) 60)
	(line (seq 0.1 0.8) (ch 3 5 7))
	(st 100)
	(st 1)
)