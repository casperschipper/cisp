(fun top
	(line (ch 40 100) (ch 17 15 33)))

(fun bottom
	(line (ch 40 80) (ch 17 15 33)))

(fun mupper
	(t
		(ch 0.14)
		(seq 13 17)))

(fun change
	(seq
		(latch (seq 7 7 7 7 7 7 7 7 7 7 12 12 12 12 12 12 12 7 12) (st 32))
		(st 1)))

(# table 
	(collect 
		(walk 54 
			(hold 
				(seq 5 -7) (seq 4 3 3 4 4 3 3 4 4 3 3))) 128))

(print table)

(fun sizer
	(t
		(seq  3 4)
		(ch 13 17 15)))

(fun stepy
	(index table (+ (count sizer) (line (bouncy-walk 0 128 (* (ch 1 2 4 8 16 32) (ch -1 1) )) (ch 15 14 17 33))))
)

(clone
(midi-note
	mupper
	(index (list stepy stepy) (hold (count 2) sizer))
	(st 0.2)
	(st 70)
	)
2)