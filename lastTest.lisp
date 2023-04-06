
(sync 0.16)

(solo)

(fun five
	(seq 5 7 12 14 19 24 9 0 2))

(fun zero
	(seq 0 2 5 7 0 2 2 0 9))

(fun freqy
	(mtof
		(+ 43.35
			(+ 
				(seq 0 (seq five 5 5 5 five five) 7)
				(hold
					(seq 0 (seq zero 0 0  zero) 7)
					(ch 2 3 4 3 2))))))

(fun harmonics
	(reset 
		(walk 0 (ch 100 (rv 0.0 5)))
		(st 50)
		(ch 3 5 2 2 7)))

(fun filterf
	(line
		(seq 10000 5000)
		(ch 2 4 8)))

(fun dura
	(line (seq 0.01 2.0) (ch 3 5 7)))

(sci2
	pulse
	(st 0.16)
	:freq (seq harmonics freqy freqy harmonics harmonics freqy)
	:duration (* (seq dura dura dura) 2.0)
	:filter (seq
		filterf filterf filterf)
	:pan (st 0)
	:attack (line (seq 0.001 4 5 4 3 1 6) (st 30)))
