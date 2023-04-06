(~ fiveOr
	(t (seq 5 4 17) (rv 3 7)))

(~ zeroOr
	(t (seq 0 -12 -4 -2 -7) (rv 3 7)))

(fun cycle
	(hold
		(seq 7 (~ fiveOr) (~ zeroOr) (ch -5 12))
		(ch 1 1 1 1 1 1 1 2)))

(fun secr
	(seq cycle cycle cycle))

(clone
	(sci saw
		(seq 0.12 0.11 (* (st 0.23) (ch 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1)))
		(mtof (+ secr 60))
		(line (seq 0.25 0.5) (ch 2 7 17 13))
		(st 1.0)
		(rvfi -1 1))
	4
)