// Guarded test starts with startValue 

(fun almostThree
	(line
		(seq 3.0 (rv 2.9 3.000) (rv 3.0 3.1))
		(st 7)))

(fun freq
	(guardedWalk
		100 (
			(| (< 20) (* (seq almostThree almostThree)))
			(| (> 20000) (/ (seq almostThree almostThree)))
			(guard (* 
				(/ (seq (fill 7 1 4)) (seq (fill 8 1 4))
				))))))

(clone

(step-gen
	(* (cycle (t freq (rv 0.01 0.01))) 0.3)
    (st 1))

6)
