(fun a
	(line
		(seq 2 400)
		(ch 5 7)))

(fun b
	(line
		(ch 1000 1100)
		(rv 100 101)))

(fun c 
	(line
		(ch 4900 4911)
		(rv 100 101)))

(fun freq
		(linseg 
			(ftom (list-walk (list 3 30 b 100 14000 c) (hold (seq 1 2 3) (seq 127))))
			(ftom (list-walk (list 5100. b 4900 10 80 10000) (hold (seq 1 2 3) (seq 128))))
			a))

(clone (step-gen
	(cycle (mtof freq))
	(st 1) :pan (rvfi -1 1)) 1)

