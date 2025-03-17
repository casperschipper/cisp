(fun a
	(list-walk 
		(list 60. 62 64 65 67 69 71 72)
		(hold (seq 1 2 3) (rv 4 10))))

(fun b
	(list-walk 
		(list 64 67 72 74 82)
		(hold (seq 1 2 3) (rv 4 10))))

(fun c
	(list-walk
		(list 50 55 60 65 70 75 80 85)
		(hold (seq 1 2 3) (rv 8 10))))

(midi-note-channel
	(st 0.14)
	(hold (seq a b c) (hold (seq 2 1) (seq 7 11)))
	(ch 0.2)
	(seq 80)
	(seq 0 1 2))