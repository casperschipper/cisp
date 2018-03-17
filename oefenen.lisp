(sync 0.16)

(solo)

(fun five
	(hold
		(seq 5 5 5 3 9 12 14)
		(ch 1 2 3 2 3 4)))

(fun filterf
	(line
		(seq 100 (ch 100 5000)  3000)
		(ch 1 3 5 7 11)))


(~ basic
	(mtof (+
		48
		(+ (seq 0 five 7)
		(hold (seq 0 (seq 5 5 five five five) 7) (ch 2 3 4 3 5 2))))))

(~ diffy
	(reset
		(walk 0 (ch (bounded-mup-walk 1 200 (ch 0.5 1.0 2.0)) (st 100)))
		(ch 100 50)
		(ch 3 4 5)))

(sci2
	pulse
	(line (seq 0.1 0.5) (ch 3 7))
	:freq (~ diffy)
	:duration (* (mtof (slider 1 :d 10)) 0.01)
	:filter (seq filterf filterf filterf) 
	:pan (line (seq -1 1) (fractRandTimer (ch 0.1 0.2 0.4 1.0)))
	:attack (* (mtof (slider 2 :d 10)) 0.001)
	)