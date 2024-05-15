(sync 0.25)

(# table (60. 62 64 65))

(fun a 
	(hold
		(count 4)
		(seq 2 3 1 3 2 3)))

(fun b
	(hold
		(count 4)
		(seq 5 1 7 1 4 2 2 2)))

(fun c
	(hold
		(count 4)
		(seq 1 1 1 1 3 1 1 1 3 7 5)))

(fun d
	(hold
		(count 4)
		(seq 4 3 5 4 3 4 3 1 1 1 7 5 4)))


(midi-note-channel
	(st 0.25)
	(index table (seq a b c d))
	(st 1.0)
	(st 100)
	(st 1))

(sync 0.25)

(# table2 (72. 36 48 67 70 74 76))

(midi-note-channel
	(hold (seq 0.25 0.75) (hold (seq 3 1 4 16) (seq 1 2 1 2 1 1 2 5)))
	(+ (latch (index table2 (seq a (+ b 4) (+ c 1) (+ d 1) (* c 2) (+ b 2) a)) (st 1)) (latch (seq 0 2 2 0) (seq 2 4 4 2)))
	(st 1.0)
	(st 100)
	(st 1))
