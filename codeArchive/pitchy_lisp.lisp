(sync 0.25)

(midi-note-channel
(st 0.125)
(seq 
	(hold (loop (reset (bounded-walk 50 72 (ch -7 0 5 7)) (bounded-walk 50 72 (ch -7 0 5 7)) (st 4)) (st 3) (st 3)) (ch 1 3))
	(hold (loop (reset (bounded-walk 50 72 (ch -12 0 12)) (bounded-walk 50 72 (ch -7 0 5 7)) (st 4)) (st 3) (st 3)) (ch 1 7))
	(hold (loop (reset (bounded-walk 50 72 (ch 0 5 -5)) (bounded-walk 50 72 (ch -7 0 5 7)) (st 4)) (st 3) (st 3)) (ch 1 5)))
(ch 0.1 0.1 0.1 0.1 0.1 3.0)
(seq 
	(line (seq 40 100) (rv 0 1))
	(line (seq 40 100) (rv 2 3))
	(line (seq 40 100) (rv 1 2)))
(st 1))

