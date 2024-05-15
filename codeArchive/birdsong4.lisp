(fun a
	(line
		(seq 200 400)
		(ch 5 7)))

(fun b
	(line
		(ch 1000 1100)
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
			(ftom (list-walk (list 3 30 b 100 14000 c) (hold (seq 1 2 3) holder)))
			(ftom (list-walk (list 5100. b 4900 10 80 10000) (hold (seq 1 2 3) holder)))
			a))

(clone (step-gen
	(cycle (mtof freq))
	(st 1) :pan (rvfi -1 1)) 8)

