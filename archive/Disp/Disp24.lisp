(fun a
	(list-walk 
		(collect (walk 40 (st 12)) 7)
		(hold (seq 1 2 3) (rv 4 10))))

(fun b
	(list-walk 
		(collect (walk 47 (st 12)) 7)
		(hold (seq 1 2 3) (rv 4 10))))

(fun c
	(list-walk
		(collect (walk 44 (st 12)) 7)
		(hold (seq 1 2 3) (rv 8 10))))

(midi-note-channel
	(st 0.14)
	(hold (seq a b c) (hold (seq 1) (seq 7 11)))
	(hold (seq .04 .05 .01 0.05 0.5) (hold (seq 1 2) (seq 7 3 9)))
	(hold (seq 80 40 90 100) (hold (seq 1 2) (seq 7 3 9)))
	(hold (seq 1 2 3) (hold (seq 1 2) (seq 7 3 9))))