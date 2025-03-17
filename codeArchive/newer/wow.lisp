(sync 0.14)

(midi-note-channel
	(ch 0 0.14 0.28)
	(+ 
		(
		(hold (seq 60 65 70) (ch (latch (st 1) (st 7)) 7 11 12))
		(hold (seq 0 5 10) (ch (latch (st 1) (ch 1 7 11)) (ch 1 7 11 5)))
		(hold (seq 0 -12 12 7) (ch (latch (st 1) (ch 1 7 11)) 11 1))))
	(st 0.14)
	(st 100)
	(st 3))