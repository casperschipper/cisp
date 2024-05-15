(fun harm
	(t
		(rv 99 102)
		(ch 0.1 0.4 0.5 1.0 2.0))
		)

(fun octaver
	(bounded-mup-walk (st 0.25) (st 8.0) (/ harm harm)))

(sci2
	simple
	(st 0.1)
	:freq (* 400 (/ harm harm))
	:amp (st 0.01)
	:dur (st 10.0)
	:pos (rv -1 1)
	)