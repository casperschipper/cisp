(sync 0.14)

(midi-note-channel
	(st 0.14)
	(reset (walk 48 (seq (sometimes (st 0) (seq 9 9 9 9 7 5 9 9 9 9 5 -24 7) (st 0.01)) 7)) (st 67) (seq 2 2 2 3))
	(seq (latch (st 0.1) (st 5)) (st 1.0) )
	(* (hold (seq 100 70) (hold (seq 1 2) (seq 3 4))) (line (seq 0.6 1.1) (seq 3 5 1)))
	(st 1))

