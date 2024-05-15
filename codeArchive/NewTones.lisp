(~ 
	freqsy
	(line
		(seq 0.05 0.5)
		(rv 10 30)))

(~ selectory
	(t
		(rv 0 4)
		(ch (grow 1 2 6))))

(fun scaleType
	(index
	(list
		(seq 0 5 10 15 20 25)
		(seq 0 2 4 8 10 12)
		(seq 0 12 24 36 48 52)
		(ch 0 4 8 12 8 4)
	)
	(~ selectory)
	))




(clone 
(midi-note
	(/ 1.0 (mtof (scaleAC (~ freqsy) (st 120) (st -70))))
 	(+ (t (ch 40 47 54 61) (rv 1 3)) 
 		scaleType)
 	(st 0.3)
	(st 90)
	) 2)
