// note, duration, velo, channel, trigger

(fun a (nas) 
	(hold nas (ch 5 7 11)))

(midi-note-channel-trigger
	(+ 72
		(seq
			(a (seq 0 4 8 12))
			(a (seq 0 2 4 5 4 2))
			(a (seq -7 0 7))))
	(st 0.5)
	(+ 40
		(seq
			(a (seq 40 40 80 100))
			(a (seq 20 20 80 80))
			(a (seq 40 50 60 50))))
	(st 1)
	(seq 1)
	)