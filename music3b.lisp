(fun filterf
	(line
		(seq 100 10000)
		(ch 2 4 8)))

(sync 0.2)

(fun hund
	(line
		(seq 100 95 1009)
		(ch 1 4 9)))

(sci2 pulse
(seq (latch (st 0) (seq 0 2 4 0 4 2 0 0 0 0 0 0 2 2)) (st 0.14))
:freq (+ 
	(
		(seq hund 200 (* hund 3)) (seq -.1 2 100 50 400 (rv -0.5 0) (* hund 3)) (seq 0 0 100 0 0 200 0) (seq -.2 0 0 -50 -100 0 0 0 0 0 300 400)
		))
:duration (seq 0.1 0.1 0.5 (ch 1 1 1 1 1 1 1))
:filter (seq filterf filterf filterf))