/* block */

(~ tempo (st 0.13))


(fun onevelo 
	(hold 
		(ch 40 90 50 100 60 120) 
		(hold 
			(ch 1 2 (ch 1 2 3 2 1 2 2 1 3))
			(seq 3 5 (ch 4 4 4 4 4 4 4 4 4 4 5)))))



(midi-note-ctrl
	(~ tempo)
	(st 36)
	(st 0.05)
	(seq onevelo onevelo onevelo onevelo onevelo onevelo)
	1
	(seq onevelo)
	)
(midi-ctrl
	(~ tempo)
	(st 1)
	(st 2)
	onevelo)

(midi-note
	(~ tempo)
	(st 44)
	(st 0.05)
	(linlin (seq onevelo onevelo onevelo onevelo onevelo) (st 0) (st 128) (st 80) (st 110))
	)

(midi-note
	(~ tempo)
	(st 38)
	(st 0.05)
	(seq (ch 90 120 128) (latch (ch 50 50 50 50 50 50 128) (st 4)) (st 0) )
	)


(fun wolk
	(line
		(seq 1 1000)
		(st 2)))

(midi-note
	(/ (~ tempo) 60)
	(seq 43)
	(st 0.05)
	(seq
		(latch (sometimes (st 100) (st 0) wolk) (st 59))
		(seq (st 100) (latch (ch 50 50 50 50 50 50 128) (st 4)) (st 0) )
	))