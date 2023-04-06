(sync 0.125)



(midi-note
	(beat (st 120) (seq 2 2 3 3 3 2 2 1 3 3 3 4 4 4 4))
	(hold (+ 40 (seq 12 12 0 12 12 12 0 12 12 0 12 0)) (seq (latch (st 2) (st 10)) 7))
	(beat 120 5)
	(line (seq 0 100) (st 11)))

(midi-note
	(beat (st 120) (seq 3 3 3 3 3 3 3 3 3 3 4 4 4 4))
	(+ 52 (seq 0 7))
	(beat 120 5)
	(line (seq 0 100) (st 17)))

(midi-note
	(beat (st 120) (st 2))
	(+ 52 (seq 12 14))
	(beat 120 2)
	(st 100))

(midi-note
	(beat (st 120) (st 3))
	(+ 52 (seq 7 9))
	(beat 120 3)
	(st 100))

(midi-note
	(beat (st 120) (st 0.33333333333333))
	(+ (+ 40 (* 7 (seq 6 5 4 3 2 1))) (hold (seq 0 2 -7) (st 6)))
	(st 3)
	(st 100))

(fun steppy
	(hold
		(seq 2 3 4 5 7 12)
		(st 14)))

(midi-note
	(beat (st 120) (st 4))
	(hold (bounded-walk (st 40) (st 64) steppy) (st 1))
	(st 0.1)
	(line (seq 0 120) (st 33)))



