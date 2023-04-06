(sync 0.16)

(solo)

(fun fv
	(hold (seq 0 7 12 14 24 0 0 7) (ch 2 3)))

(fun filterf
	(line
		(seq 0)
		(ch 1 5 10))
	)

(fun harm
	(reset
	(walk 0 (hold (ch (rv 0 1) 0.01 0.3 0.25) (ch 1 2)))
	(seq 50 25)
	(ch 3 4 7)))

(fun basic 
	(mtof (+ 
		(+ 43.34 
		(seq 0 (seq 5 5 fv fv) 7))
		(hold (seq 0 5 7) (ch 2 3 4 2 3 5)))))

(fun mupwalky
	(reset
		(bounded-mup-walk 20 4000 (ch 1.0 2.0))
		(st 100)
		(hold (seq 2 3 4) (ch 4 5))))


(fun a
	(line
	(seq 0 5)
	(hold (seq 1 3 5) (ch 1 3 4))))


(sci2
	pulse
	(st 0.16)
	:freq (seq harm harm harm)
	:duration (st 3)
	:filter (seq
		filterf filterf filterf)
	:pan
	(line
		(seq -1 1) (ch .1 .5 2 3))
	:amp (hold (seq 0.1 0.2 0.0 0.9 0.4) 
		(hold (seq 2 3) (ch 3 4)))
	:attack (line (seq 0.001 3) (st 30))
	)



