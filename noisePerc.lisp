(# table (steno "0..24"))

(fun walky
	(hold (sometimes (rv 0 12) (seq -1 1 -1 1) (st 100)) (hold (seq 1 2 3) (seq 3 5 1 7 1 3 11))))

(sync 1.0)

(midi-note-channel
	(st 0.1)
	(+ 55 
		(list-walk table walky))
	(st 0.3)
	(seq 128 (seq 20 120) (st 90) (st 120))
	(st 1.0))


