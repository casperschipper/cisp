(fun a
	(list-walk 
		(list 60 64 68 72 76)
		(hold (seq 1 2 3) (rv 4 10))))

(fun b
	(list-walk 
		(list 53 60 67 74 81)
		(hold (seq 1 2 3) (rv 4 10))))

(fun c
	(list-walk
		(list 50 55 60 65 70 75 80 85)
		(hold (seq 1 2 3) (rv 8 10))))

(midi-note-channel
	(st 0.14)
	(hold (seq a b c) (hold (seq 2 1) (seq 7 11)))
	(hold (seq .1 .2 .3) (hold (seq 1 2) (seq 7 3 9)))
	(seq 80)
	(hold (seq 1 2 3) (hold (seq 1 2) (seq 7 3 9))))