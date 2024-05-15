(fun dir
	(hold
		(seq 1 -1)
		(seq 5 7 6 5 11 3 5)))

(midi-note-channel
	(seq
		(latch (line (seq 0.05 0.4) (st 22)) (st 5))
		(latch (line (seq 0.1 1) (st 7)) (st 1))
	)
	(bounded-walk (st 20) (st 80) (* (seq (seq 7 7 4) (seq 7 7 7 7 5)) dir))
	(seq 4)
	(* (seq 80 40 40) (line (seq 1 0.2) (st 33)))
	(st 1.0))