(fun stepSet
	(loop
		(ch -2 2 0 7 12 -12 5 24 19 17)
		(ch 5 9 11 13)
		(ch 2 3)))

(~ offset
	(t 
		(seq 58 60 61)
		(ch 17 33)))

(fun freq
	(mtof 
		(+ 
			(seq (+ 0 (hold stepSet 5)) (+ 0 (hold stepSet 2)) (+ 7 (hold stepSet 1))) 
				(~ offset))))

(fun timing
	(t
		(ch 3 1 1.5 0.1 0.2 0.01)
		(ch 3 5 11)))

(clone 
(step-gen
(seq -1 1)
(/ 44100 (t freq 0.14)) :pan (rvfi -1 1)) 3)