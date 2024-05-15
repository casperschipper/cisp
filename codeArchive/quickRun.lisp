(fun a
	(list-walk (1.0 2.5 5) (hold (seq -1 1) (seq 1 1 1 1 2 1 (ch 1 2)))))

(fun b
	(list-walk (1) (hold (seq -1 1) (seq 1 1 1 1 2 1 (ch 1 2)))))

(sci2
	simple
	(st 0.01)
	:freq (* (* (/ a a) 2000) (bounded-mup-walk (st 0.25) (st 4.0) (/ b b)))
	:dur (line (ch 2.0 0.5 5.0) (st 3))
	:amp (st 0.01)
	:pos (hold (rv -1 1) (seq 2 3))
	)