// little random
// mostly sections of seq in seq, not same length

// timer

(fun fif
	(hold 
		(seq 54 56 57 58 64) 
		(seq 2 3 4)))

(fun seven
	(hold 
		(seq 73 75 74 77 80)
		(seq 3 7 11)))

(fun middle
	(index
		((seq 66 78)
		(st 66)
		(seq 66 54))
		(hold (count 3) (seq 3 4 3 7 11))
	))

(fun interval
	(hold 
		(seq 4 0 12 0 -12 0 24) (seq 11 13 17)))

(fun interval2
	(hold 
		(seq 7 0 12 0 -12 0 24) (seq 21 3 5 7)))

(midi-note
(* (seq 0.13 0.11) 1.0)
(+ (seq fif 61 middle seven) (seq (list 12 7 12 7 0 -4 -7) true :max (hold (seq 2 4) (seq 13 15 17))))
(st 3.0)
(seq 40 80 100)
)