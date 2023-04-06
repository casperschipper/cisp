(fun oct x
	(+
		x (hold
			(seq 0 -12 12 7 -7)
			(ch 3 7))))

(fun holden_pitch
(seq
	(list (latch 
    	(seq (oct (st 0)) 2 7 2 7 (oct (st 9)) true)
    	(st 3)
    	)
    (seq 2 9 5 true)
    (seq (oct (st 7)) 2 (oct (st 0)) true)
    (seq (oct (st 5)) 0 -2 true)
    (seq 2 -2 (oct (st -5)) true))))

(# table (collect holden_pitch 400))

(print table)

(fun offset 
	(line (ch 0 (rv 0 400) 400) 
		(ch 15 17 33)))

(clone
(midi-note
(* (seq 0.14 0.14 (ch 0.14 0.14 0.14 0.28 (ch 2.24 0.14 0.14 0.14 4.48))) 1.25)
(+ (hold (+ (index table (+ (count2 3 true) offset)) 56) (weights ((1 100) (8 3)))) (t (seq 0 1) (ch 33 37)))
(st 0.05)
(hold (seq 100 80 100 80 70) (ch 1 1 1 1 1 1 1 1 1 1 1 1 5))
)  3)