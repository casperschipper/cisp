
(fun twoone
	(hold (seq 1 2) (st 7)))

(midi-note-channel
	(st 0.18)
	(+ 60 (index (list 0. 2 4 5 7 9 11 12) (+ (seq 0 twoone 0 true) (walk 0 (hold (seq -1 1 -3 5) (seq 2 3 2 1 2 3 2 1 1 2))))))
	(st 0.1)
	(hold (index (list 60 40 70 60)
		(seq 1 0 1 2 (latch (st 0) (seq 2 2 2 2 1)))) (seq 1 1 1 1 1 1 1 2))
	(st 1))

(midi-note-channel
	(st 0.18)
	(+ 72 (index (list -14 -7 0 2 4 5 7 14 21) (+ (seq 0 3 0 true) (walk 0 (hold (seq -1 1 -3 5) (seq 2 3 2 1 2 3 2 1 1 2))))))
	(st 0.1)
	(hold (index (list 50 80 82)
		(seq 1 0 1 2 (latch (st 0) (seq 2 2 2 2 1)))) (seq 1 1 1 1 1 1 1 2))
	(st 1))


