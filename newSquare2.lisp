(fun amp
(seq -1 1))

(~ boundary
	(t
		(/ 1.0 (rf -8 150))
		(ch 1. 2 3 4)))

(~ boundary2
	(t
		(/ 1.0 (rf -8 180))
		(ch 1. 2 3 4)))

(~ boundary3
	(t
		(/ 1.0 (rf -8 180))
		(ch 1. 2 3 4)))

(fun timer
	(fractRandTimer
		(loop
			(/ 1.0 (rf -60 80))
				(ch 1 2 4 8)
				(ch 1 2 4 8))))

(clone
(step-pan-gen 
	(bounded-walk -.1 .1 
		(t (bounded-walk (* -1 (~ boundary)) (~ boundary)
			(t (bounded-walk (* -1 (~ boundary2)) (~ boundary2) 
				(t (bounded-walk (* -1 (~ boundary3)) (~ boundary3)(ch -0.00001 0.00001)) timer )) timer))  timer)) 
	(st 1)
	(bounded-walk -1 1 
		(t (bounded-walk (* -1 (~ boundary)) (~ boundary)
			(t (bounded-walk (* -1 (~ boundary2)) (~ boundary2) 
				(t (bounded-walk (* -1 (~ boundary3)) (~ boundary3)(ch -0.00001 0.00001)) timer )) timer))  timer))
) 
2)