(fun sixtyfour
	(hold 
	(seq 63 (+ 63 12) 65)
	(ch 15 17 13)
	))

(fun sixty
	(hold 
	(seq 60 (+ 60 12) 62 (- 60 7))
	(ch 13 7 5)
	))

(clone 
(midi-note
	(seq 0.12)
	(loop (+ (seq sixty sixtyfour 67 70 true) (hold (seq 0 4 7) (seq 5 9 7 3))) (ch 7 5 3) (st 3))
	(st 0.11)
	(st 80)
	)
3)
