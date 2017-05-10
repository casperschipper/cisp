(fun devi 
	(rv 0 (line
	 (seq 0.001 12 -12 7 7 0.001 0) (ch 3 4 5))))

(~ walky 
	(reset
	(walk 0 (+ (ch 5 5 5 5 5 -5 -5 -5 -4 4 -5) devi))
	(st 0)
	(st 10)))

(~ fiveOr
	(t (~ walky) (rv 3 7)))

(~ zeroOr
	(t (~ walky) (rv 3 7)))

(fun cycle
	(hold
		(seq 7 (~ fiveOr) (~ zeroOr) (ch -5 12))
		(ch 1 1 1 1 1 1 1 2)))

(fun secr
		(seq cycle cycle cycle)
	)

(clone
	(sci saw
		(seq 0.10 0.08)
		(mtof (+ secr 60))
		(line (seq 1.0 2.0) (ch 2 7 17 13))
		(st 1.0)
		(rvfi 0 0))
	1
)