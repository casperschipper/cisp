(fun oct (foo)
	(+
		foo 
		(t
			(seq -12 0 12)
			(ch 1 7 11 33))))

(fun holden_pitch
(seq
	(list (latch 
    	(seq 0 2 7 2 7 9 true)
    	(st 3)
    	)
    (seq 2 9 5 true)
    (seq (oct 7) 2 0 true)
    (seq 5 0 -2 true)
    (seq 2 -2 -5 true))))

(# table (collect holden_pitch 30))

(fun offset 
	(line (seq 0 11) 
		(ch 15 17 33)))

(clone
(midi-note
(seq 0.14 0.14 0.14)
(+ (index table (+ (count2 3 true) offset)) 56)
(seq 0.3 0.3 0.6)
(st 100)
)  4)