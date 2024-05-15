(fun a
	(list-walk (1 2 3 4 5 6 7 8) (ch 1 1 1 1 1 1 1 1 1 1 2 3)))

(sci2
	simple
	(st 0.01)
	:freq (* (st 400) (/ a a))
	:dur (st 10.0)
	:amp (st 0.01)
	:pos (line (ch -1 1) (hold (ch 3 5 7 11) (ch 100)))
	)