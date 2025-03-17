(fun a
	(seq 72 70 68))

(fun b
	(seq 67 65 63 60 74))

(fun c
	(seq 60 62 64 62))

(fun d
	(seq 58 58 58 60 65 72 58))


(fun holdm (arg)
	(hold arg (ch 3 5 7 11 13 15)))

(midi-note-channel
	(st 0.14)
	(seq (holdm a) (holdm b) (holdm c) (holdm d))
	(line (seq 0.1 1.0) (ch 3 5 7))
	(st 100)
	(st 1))