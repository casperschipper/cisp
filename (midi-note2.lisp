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

(midi-note
(st 0.11666667)
(seq fif 61 middle seven)
(st 0.10)
(seq 40 80 100)
)