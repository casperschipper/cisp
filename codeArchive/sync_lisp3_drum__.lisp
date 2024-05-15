// note, duration, velo, channel, trigger

(fun a (nas) 
	(hold nas (ch 5 7 11)))

(midi-note-channel-trigger
	(index (list 36 38 42 44) (bounded-walk 0 3 (hold (ch -1 1) (ch 1 2 3))))
	(st 0.1)
	(loop (list-walk (list 20 50 60 40 100 128) (hold (ch -1 1) (ch 1 2 3))) (st 2) (st 2))
	(st 1)
	(seq 1)
	)