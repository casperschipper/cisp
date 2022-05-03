(sync 0.2)

(midi-note-channel
(hold (seq 1.2 2.4 0.6 0.3) (seq 3 7 5 11 3))
(reset (walk 72 (ch -7 -4 -3)) (st 72) (ch 2 2 2 2 2 2 9))
(seq 3)
(seq 
	(latch (st 0) (seq 1 2))
	(latch (st 100) (st 3))
)
(st 1)
)

(midi-note-channel
(hold (seq 1.2 2.4 0.6 0.3) (seq 7 9))
(reset (walk 50 (ch 2 5)) (st 60) (ch 2 2 2 2 2 2 9))
(seq 3)
(seq 
	(latch (st 0) (seq 3 1 1 1))
	(latch (st 100) (st 3))
)
(st 1)
)

(midi-note-channel
(hold (seq 1.2 2.4 0.6 0.3) (seq 4 1))
(reset (walk 84 (ch -7 -5)) (st 60) (ch 5 17))
(seq 3)
(seq 
	(latch (st 0) (seq 11 13))
	(latch (st 100) (st 7))
)
(st 1)
)
