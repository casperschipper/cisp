(fun a (off)
	(+ off (hold 
		(reset (walk -12 (ch -2 2 -2 2 -2 2 -1 1 -12 12)) (st 0) (rv 3 4))
		(ch 4 9))))

(fun b
	(line
		(seq 40 100)
		(ch 3 7 9)))

(midi-note-channel 
	(seq 0.14 0.12)
	(index 
		(list 
			(a (st 60)) (a (st 64)) (a (st 68)) (a (st 72)) (a (st 76)) (a (st 80))
			)
		(seq 0 1 (seq 2 2 2 3 2 4 6 7) 1 0 1 3 1 0))
	(st 1.0)
	(seq b b b)
	(st 1))