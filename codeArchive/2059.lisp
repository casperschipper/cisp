(fun a
	(t
		(ch 400 401 400.0001)
			(ch 0.1 0.2 0.3 0.5 4 8 )))

(step-pan-gen
(seq -1 1)
a
(st (rvfi -1 1))
)