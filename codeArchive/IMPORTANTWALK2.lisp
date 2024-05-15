(fun top
	(line (ch 40 100) (ch 17 15 33)))

(fun bottom
	(line (ch 40 80) (ch 17 15 33)))

(fun mupper
	(t
		(ch 0.13)
		(seq 13 17)))

(fun change
	(seq
		(latch (seq 7 7 7 7 7 7 7 7 7 7 12 12 12 12 12 12 12 7 12) (st 32))
		(st 1)))

(# table (collect (bouncy-walk 40 76 (* (hold (series 7 5 -5 (* -1 change) change) (seq 1 2 3 5)) 1)) 128))

(fun sizer
	(t
		(seq 1 2 3 3 4 3 4 3 4 3 3 4)
		(ch 13 17 15)))

(clone
(midi-note
	mupper
	(index table (+ (count2 sizer true) (line (bounded-walk 0 128 (ch 1 2 4 8 16 32)) (ch 0.1 3 17 33))))
	(st 0.2)
	(st 100)
	)
2)