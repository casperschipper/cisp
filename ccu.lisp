(fun timer
	(t
		(/ 1.0 (bounded-mup-walk 0.5 20.0 (ch 0.66667 1.5)))
		(ch 1 2 3 5)))

// too much chaos!

(fun lowinterval
	(t
		(seq 0.666667 0.5 (seq 2 3) 0.333333)
		(st 0.25)))


(fun top
	(line
		(seq 100 20000)
		(ch 1 3 7)))

(fun detune
	(line
		(seq 0.9999 1.4)
		(ch 3 5 7)))


(fun f2 (bounded-mup-walk
	(st 100) top (* (ch lowinterval 1.5) detune)))

(fun freq
	(t
		(seq f2 f2 f2)
		timer))


(clone
(step-gen
	(index OSC.table1 
		(line (seq 0 128) (/ 1.0 freq )))
	(st 1)) 8)