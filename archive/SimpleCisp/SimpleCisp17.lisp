(fun a
	(reset 
		(walk 72 (ch -2 2))
		(st 72)
		(rv 4 7)))

(fun b
	(reset 
		(walk 67 (rv -2 2))
		(st 67)
		(rv 4 7)))

(fun c
	(reset 
		(walk 64 (ch -2 2))
		(st 67)
		(rv 4 7)))

(fun d
	(reset 
		(walk 58 (ch -1 1))
		(st 58)
		(rv 4 7)))


(fun holdm (arg)
	(hold arg (ch 3 5 7 11 13 15)))

(midi-note-channel
	(st 0.14)
	(seq (holdm a) (holdm b) (holdm c) (holdm d))
	(line (seq 0.5 2.0) (ch 3 5 7))
	(seq 100 80 70)
	(st 1))