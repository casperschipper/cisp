(fun top
	(line (ch 40 100) (ch 17 15 33)))

(fun bottom
	(line (ch 40 80) (ch 17 15 33)))

(fun mupper (seq 0.15 0.13))

(fun change
	(seq
		(latch (seq 7 7 7 7 7 7 7 7 7 7 12 12 12 12 12 12 12 7 12) (st 32))
		(st 1)))

(fun five
	(hold
		(seq 5 (ch -1 1))
		(seq (rv 23 27) 1)))

(# table 
	(collect 
		(walk 60 
			(hold 
				(seq five -7) (seq 4 3 3 4 4 3 3 4 4 3 3))) 128))

(print table)

(fun sizer
	(t
		(ch 2 1 4 3)
		(ch 5 7 23)))

(~ stepy
	(index table (+ (count sizer) (line (bouncy-walk 0 128 (* (ch 1 2 4 8 16 32) (ch -1 1) )) (ch 15 14 17 33))))
)

(fun offset
	(hold
		(ch 0 5 -5 -7 7 -12 12)
		(ch 3 7 13 15 17)))

(clone
(midi-note
	mupper
	(+ (~ stepy) offset) 
	(st 0.2)
	(st 70)
	)
2)