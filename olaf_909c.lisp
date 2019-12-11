/* block */

(~ tempo (st 0.14018692))

(fun onevelo 
	(hold (ch 40 60 80 90 100 110 128) (ch 3 5 4)))


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