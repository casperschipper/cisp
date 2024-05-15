(fun start
	(hold 
		(seq 24)
		(seq 11 6)))

(sync 0.2)

(midi-note-channel
(seq 0.2)
(reset (walk 60 (ch 3 4 7 5)) start (seq 2 5 7))
(seq 0.5 0.1 0.1 0.1)
(seq 100)
(st 1)
)