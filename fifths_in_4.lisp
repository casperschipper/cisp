

(fun twelve
	(hold
		(seq 12 7 (seq 4 4 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3 3 3 3 3))
		(seq 2 3 3 2)))

(fun seven
	(hold
		(seq (seq 7 7 7 7 7 7 7 7 7 5) 12 9)
		(seq 2 3 2 2 3)))

(fun holdm (arg)
	(hold
		arg
		(seq 3 5 1 7)))

(midi-note-channel
	(hold (seq 3 5 1 5 7) (seq 2 2 2 3 2 1 3 4 5)) 
	(+ 45 (seq twelve seven (seq 0 (holdm (seq 2 (seq 14 14 14 14 14 14 13 13 13 13 13 13) 7))  (holdm (seq 2 9 (seq 14 14 14 14 14 16 16 16 16))))))
	(hold (seq 5 10 15) (seq 4 1 3 5 1 2))
	(hold (seq 100 80 40 120) (seq 3 2 5 3 2 7 1))
	(st 1))




