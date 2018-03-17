
(sync 0.31)

(fun diff
	(line
		(* (seq 100 101 99.99 90 110) 1.5)
		(ch 2 5 9)))

(sci2
	pulse
	(seq (seq 0.2 0.18) 0 0)
	:freq 
	(loop 
		(reset (walk 0 (hold (seq diff diff diff) (ch 1 1 1 1 1 2 3))) (ch 100 50) (seq 4 3 2 5 7))
		(ch 2 3)
		(ch 3 4 5))
	:duration (st 1.5)
	:filter (st 5000)
	:pan (hold (seq -1 0 1 0.5) (ch 1 1 1 1 1 2 3))
	:attack (st 0.1)
	)

(walk 0 
	// guards
	((test) (action))

	(mtof (seq 40 45 52))

	| ((< 10) (* 3))
	| ((> 20) (/ 2)))

class MonoFunc extends Stream {
	fun float next(float value) {
		return a value;
	}
}