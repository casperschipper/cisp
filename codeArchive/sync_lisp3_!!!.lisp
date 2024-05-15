// note, duration, velo, channel, trigger

(fun a (nas) 
	(hold nas (ch 5 7 11)))

(midi-note-channel-trigger
	(reset (walk 60
		(seq
			(a (seq 0 1))
			(a (seq -24 -12 0 0 12 24))
			(a (seq 0 7 14 21)))) (st 60) (rv 3 11))
	(seq
			(a (seq 0.1 0.2 0.4))
			(a (seq 0.5 0.1 0.1))
			(a (seq 0.9 1.5 2)))
	(+ 20
		(seq
			(a (seq 40 40 80 100))
			(a (seq 20 20 100 80))
			(a (seq 100 50 60 50))))
	(st 1)
	(seq 1)
	)