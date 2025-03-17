(~ a
	(hold (seq 60 62)
		(st 5)))

(~ b
	(seq 64 67))

(~ c 
	(seq 72))

(~ velo
	(seq 100))


(fun calc (bpm)
	(/ (/ (st 60.0) bpm) (st 4.0)))

(midi-note-channel
	(calc (st 110))
	(seq (~ a) (~ b) (~ c))
	(st 0.3)
	(~ velo)
	(st 1))