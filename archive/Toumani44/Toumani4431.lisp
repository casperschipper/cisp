(# tabby
	(list 1. 2 4 5 7 8 9 12))

(fun liner
	(line
		(seq 0 6)
		(ch 0.1 0.5 1. 3. 4)))

(fun masked
	(index 
		tabby
		(hold (line (seq liner liner) (st .5)) (rv 4 5))))

(sync 0.14)

(midi-note-channel
	(st 0.14)
	(reset (walk 60 (* (hold (ch -1 1) (rv 3 5)) masked)) (st 60) (st 12))
	(ch 0.2 0.2 0.2 1.0 10.0)
	(+ (seq 80 50 50) (seq 100 20 20 20 20 20 0 0 -100))
	(st 1))

