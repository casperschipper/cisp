// note, duration, velo, channel, trigger

(fun a (nas) 
	(hold nas (ch 5 7 11)))

(midi-note-channel-trigger
	(+ 72
		(seq
			(a (seq 0 -7 7 0 0 7))
			(a (seq 4 0 0 4 4 0 5))
			(a (seq 12 0 24 0))))
	(st 0.1)
	(+ 40
		(seq
			(a (seq 40 40 80 100))
			(a (seq 20 20 80 80))
			(a (seq 40 50 60 50))))
	(st 1)
	(seq 1 0)
	)