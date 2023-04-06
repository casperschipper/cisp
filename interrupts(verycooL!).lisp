(fun a
	(t
		(seq (rv 1 44100) 44 1 4)
		(list-walk (.1 .3 .5 .7) (hold (seq 1 -1) (seq 30 43 2 1 30)))))

(fun b
	(line
		(ch 1 2)
		(rv 100 101)))

(fun c 
	(line
		(ch 4900 4911)
		(rv 100 101)))

(~ ntwenty
	(t
		(seq 127 2)
		(rv 44 45)))

(fun holder
	(hold
		(seq (~ ntwenty) 3 12 (~ ntwenty))
		(seq 3 1 (ch 44 45) 1)))

(fun freq
		(linseg 
			(ftom (list-walk (list 3 30 b 100 1 c) (hold (seq 0 0 1 2 3) holder)))
			(ftom (list-walk (list 2 b 30 10 80 10) (hold (seq 1 2 0 3) holder)))
			a))

(clone (step-gen
	(cycle (mtof freq))
	(st 1) :pan (rvfi -1 1)) 5)

