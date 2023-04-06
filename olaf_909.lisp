(~ tempo (st 0.14018692))

(fun onevelo 
	(line (seq 40 128) (loop (ch 1 3 7 11) (st 10000) (st 5))))


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
	(seq (latch (st 100) (st 5)) (st 0) )
	)