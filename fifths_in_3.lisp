(fun main
	(reset (walk 60 (hold (seq 7 7 -12 7 4 7 0) (weights ((1. 100) (2. 1))))) (st 54) (seq 2 2 3)))

(sync 0.14)

(midi-note-channel
	(seq 0 (latch (st 0.28) (st 1000000000000)))
	(hold main (seq (latch (st 1) (st 5)) (latch (st 2) (seq 2 3 2 2 3 2 (ch 1 3)))))
	(seq 0.01 0.01 0.01 0.1 0.1)
	(seq 100)
	(st 1))

(midi-note-channel
	(seq 0.14 (latch (st 0.28) (st 1000000000000)))
	(hold main (seq (latch (st 1) (st 5)) (latch (st 2) (seq 2 3 2 2 3 2 (ch 1 3)))))
	(seq 0.01 0.01 0.01 0.1 0.1)
	(seq 100)
	(st 2))


(midi-note-channel
	(seq 0.28 (latch (st 0.42) (st 1000000000000)))
	(hold main (seq (latch (st 1) (st 5)) (latch (st 2) (seq 2 3 2 2 3 2 (ch 1 3)))))
	(seq 0.01 0.01 0.01 0.1 0.1)
	(seq 100)
	(st 3))



