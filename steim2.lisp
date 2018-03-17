
(sync 0.16)

(fun resetPoint
	(reset (mup-walk 100 (ch 0.666667 1.5 1.25 0.75)) (st 400) (ch 3 4)))

(fun filtLine
	(mtof
		(line (seq 40 100)
			(ch 1 4 8))))


(solo)


(sci2
	pulse
	(line (seq 0.16 0.16) (ch 1 5 9))
	:freq 
	(loop
		(index (
			(reset 
				(mup-walk 0 (ch 0.5 1.5 0.66666667 2 0.99 1.01 0.99 1.01)) 
				resetPoint (ch 3 4))
			(reset 
				(walk 0 (ch 100 200 300)) 
				resetPoint (ch 2 4 5 7)))
		(hold (rv 0 2) (ch 4 8)))

		(seq 1 2 1 3 1 1 1)
		(seq 1 3 1 3 1 2))
	:duration (line 
		(seq 1.5 5 10)
		(ch 7 11 13))
	:filter (seq filtLine filtLine)
	:attack (st 0.5)
	:pan (line
		(seq -1 1)
		(ch 0.5 1. 2. 4.))
	)
