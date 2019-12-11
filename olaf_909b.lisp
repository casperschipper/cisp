(~ tempo (st 0.14018692))

(fun onevelo 
	(line (seq 40 128) (ch 1 3 7 11)))


(midi-note
	(~ tempo)
	(st 36)
	(st 0.05)
	(seq onevelo onevelo onevelo onevelo onevelo)
	)

(midi-note
	(~ tempo)
	(st 44)
	(st 0.05)
	(seq onevelo onevelo onevelo onevelo onevelo)
	)

(midi-note
	(~ tempo)
	(st 38)
	(st 0.05)
	(seq (ch 90 120 128) (latch (ch 50 50 50 50 50 50 128) (st 4)) (st 0) )
	)