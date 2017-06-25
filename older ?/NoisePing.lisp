(sci2
	NoisePing
	(st 0.09)
	:freq (reset (mup-walk 400 (ch 0.5 2.0 0.75 1.25)) (st 400) (st 8))
	:duration (seq 1.0 0.1 (latch 0.01 30))
	:bw (ch 1.0 0.01 0.02)
	:pany (seq (sine 128 (list 0.0 1.0)))
	:panx (seq (sine 128 (list 1.0)))
	:wet (ch 0)
	:start (seq 0 1 2 3 4 5 500)

	)