(fun a
	(line
		(seq (ch 1 3 2 400 1000) 400)
		(ch (latch (st 0.5) (st 10)) 5 7)))

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
			(ftom (list-walk (list 3 30 b 100 14000 c) (hold (seq 1 2 3) (ch 1 10 200 1270))))
			(ftom (list-walk (list 5100. b 4900 10 80 10000) (hold (seq 1 2 3) (ch 1 30 55 1280))))
			a))

(clone (step-gen
	(cycle (hold (mtof freq) a))
	(st 1) :pan (rvfi 0 2)) 4)

