(fun amp
(seq -1 1))

(~ boundary
	(t
		(/ 1.0 (rf 1 150))
		(ch 1. 2 3 4)))

(~ boundary2
	(t
		(/ 1.0 (rf 1 180))
		(ch 1. 2 3 4)))

(fun timer
	(t
		(ch 0.001 0.10 0.002 0.03 0.004 0.2 0.4 1.0 4 5 8)
		(ch 4.0 16.0)))

(clone
(step-pan-gen 
	(bounded-walk -.1 .1 
		(t (bounded-walk (* -1 (~ boundary)) (~ boundary)
			(t (bounded-walk (* -1 (~ boundary2)) (~ boundary2) (bounded-walk -0.001 0.001 (ch -0.0001 0.0001))) timer) ) timer)) (st 1) (bounded-walk -1 1 
		(t (bounded-walk (* -1 (~ boundary)) (~ boundary)
			(t (bounded-walk (* -1 (~ boundary2)) (~ boundary2) (bounded-walk -0.001 0.001 (ch -0.0001 0.0001))) timer) ) timer))
) 
4)