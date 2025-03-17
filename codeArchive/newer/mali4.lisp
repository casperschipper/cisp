(fun a 
	(hold 
		(seq 0 0 0 0 2 5 (seq 7 7 7 7 7 12 -12 -12) -7)
		(ch 1 1 1 1 1 1 1 1 1 2)))

(midi-note-channel
(seq 0.17 0.13)
(index 
	(list (seq 60 (+ a (st 60)) 60 (+ a (st 60)) 62) (+ (st 67) a) (seq 72 72 (+ a (st 72))))
	(reset (walk 0 (st 1)) (st 0) (seq 3 3 2)))
(st 1.0)
(st 80)
(st 1)
)