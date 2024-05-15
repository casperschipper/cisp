(fun p
	(weights 
		((st 1) (st 100)) 
		(
			(line (seq 0 100) (st 30)) 
			(st 1)
		
		)))


(midi-note-channel
	(st 0.14)
	(st 60)
	(st 0.14)
	(seq 100 80 40 40 80 100)
	(st 1.0)
	)

(midi-note-channel
	(st 0.14)
	(seq 60 64 67 64)
	(st 0.14)
	(seq 100 100 100 40 100)
	(st 2.0)
	)

(midi-note-channel
	(st 0.14)
	(list-walk (62 69 73))
	(st 0.14)
	(hold (seq 100 80 100) p)
	(st 1.0)
	)

(midi-note-channel
	(st 0.14)
	(hold (seq 60 62 64 65) (ch 3 5))
	(st 0.14)
	(hold (seq 100 80 40 30) p)
	(st 1.0)
	)

