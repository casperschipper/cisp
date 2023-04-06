/* this is a great starter */

(~ total
	(t
		(seq 400 100 200 300 500 50 25)
		(ch (grow 1 2 5))))

(~ top
	(* (t (ch 0.5 0.25 0.6 0.001) (ch (grow 1 2 4))) (~ total)))

(~ low
	(- (~ total) (~ top)))

(fun devi
	(t (ch 50 100) (rv 0 4)))

(clone
	(step-gen
	(hold (seq -1 1)
		(+ (seq (~ top) (~ low)) devi))
	(st 1)
	)
	:pan (rvfi -1 1)
4)