(fun a 
	(hold 
		(seq 0 2 7 12 14 13 -4 4 3)
		(ch 3 4 3 2 3 4 5 6 5 4 3)))

(sync 0.12)

(midi-note
(st 0.36)
(+ (st 45) (seq (+ 0 a) (+ 7 a) (+ a 12)))
(st 1.0)
(st 64))