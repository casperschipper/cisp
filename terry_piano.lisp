(sync 0.125)


/*


(midi-note
	(beat (st 125) (st 3))
	(seq 
		(hold (seq 64 72) (st 5)) 
		(hold (seq 67 79) (st 7)))
	(st 0.1)
	(st 100)
	)

(midi-note
	(beat (st 125) (st 1))
	(+ 60 (seq 5 7 12))
	(st 0.1)
	(st 100)
	)

(midi-note
	(beat (st 125) (st 1))
	(list-walk (60 72 84) (hold (seq 0 1) (seq 3 4)))
	(st 0.1)
	(st 100)
	)
*/

(midi-note
	(beat (st 125) (st 4))
	(seq 36 48 60)
	(seq 0.01 0.2)
	(list-walk (40 100 80) (hold (seq -1 1) (rv 5 6))))


(~ seventwo
	(+ 72
		(hold
		(reset (walk 0 (ch -7 7)) (st 0) (seq 5 7 1 4))
		(seq 3 5 2))))

(midi-note
	(beat (st 125) (seq 4))
	(hold (seq (~ seventwo) (hold (seq 79 75) (seq 9 11))) (seq 1 1 2))
	(st 0.1)
	(seq 80 60 70)
	)

