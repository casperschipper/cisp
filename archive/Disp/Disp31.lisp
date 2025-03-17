(fun a
	(list-walk 
		(collect (walk 40 (st 7)) 4)
		(hold (seq 1 2 3) (rv 4 10))))

(fun b
	(list-walk 
		(collect (walk 47 (st 4)) 4)
		(hold (seq 1 2 3) (rv 4 10))))

(fun c
	(+ 
		(hold (seq 0 -1 1) (rv 40 55))
		(list-walk
			(collect (walk 43 (st 4)) 4)
			(hold (seq 1 2 3) (rv 8 10)))))

(midi-note-channel
	(st 0.14)
	(hold (seq a b c) (hold (seq 1) (seq 7 11)))
	(hold (seq 1 2 3) (hold (seq 1 2) (seq 7 3 9)))
	(hold (seq 80 10 40 55 20 90 100) (hold (seq 1 2) (seq 7 3 9)))
	(hold (seq 1 2 3) (hold (seq 1 2) (seq 7 3 9))))