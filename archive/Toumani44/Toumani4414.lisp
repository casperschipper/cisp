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

(midi-note-channel
	(st 0.14)
	(reset (walk 60 (* (ch -1 1) masked)) (st 60) (st 12))
	(st 0.2)
	(st 70)
	(st 1))

