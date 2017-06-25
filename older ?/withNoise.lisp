(fun detune
	(line (hold (ch 1 2 (rv 1 10)) (ch 1 2 8)) (fractRandTimer (ch 0.001 0.02 0.03 0.4 1.0 2.0 4.0)))
	)



(~ total
	(t
		(seq 50 100 400 200 300)
		(ch (grow 1 2 5))))

(~ top
	(* (t (ch 0.5 0.25 0.6 0.01 0.9) (ch (grow 1 2 4))) (~ total)))

(~ low
	(- (~ total) (~ top)))

(fun devi
	(t (ch 50 100) (rv 0 4)))

(clone
	(step-gen
	(hold (seq -1 1)
		(+ (+ (seq (~ top) (~ low)) devi) detune))
	(st 1)
	)
	:pan (rvfi -1 1)
4)