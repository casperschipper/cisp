(fun top
	(line (ch 40 100) (ch 17 15 33)))

(fun bottom
	(line (ch 40 80) (ch 17 15 33)))

(fun mupper
	(t
		(ch 0.14)
		(seq 13 17)))

(# table (collect (bounded-walk 40 80 (* (hold (seq 7 -7 -12 12) (seq 1 2 3 5)) 1)) 128))

(fun sizer
	(t
		(seq 1 2 3 4)
		(ch 13 17 15)))

(clone
(midi-note
	mupper
	(index table (+ (count sizer) (line (bounded-walk 0 128 (ch -10 1 2 10)) (ch 3 7 11 30 50))))
	(st 0.01)
	(st 64)
	:chan (rvi 1 3))
2)