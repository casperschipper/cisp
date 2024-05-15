(fun a
	(list-walk (1 2 3 4 5 6 7 8) (hold (seq -1 1) (seq 1 1 1 1 2 1 (ch 1 2)))))

(sci2
	simple
	(st 0.1)
	:freq (* (st 100) (/ a a))
	:dur (st 10)
	:amp (st 0.1)
	:pos (line (ch -1 1) (st 10))
	)