// Guarded walk example

// guarded walk takes a 
// starting point
// a list of guards, which are conditions, and then overloaded operators to
// apply to the previous step.

(fun freq
	(guardedWalk
		100 (
			(| (< 20) (* (seq almostThree almostThree)))
			(| (> 20000) (/ (seq almostThree almostThree)))
			(guard (* 10)))))