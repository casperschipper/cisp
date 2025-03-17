(fun b 
	(hold 
		(seq 5 7 4 12 -12)
		(ch 4 8 9)))

(fun a 
	(hold
		(seq 100 80 90)
		(ch 1 1 1 1 1 1 1 1 1 1 2)))

(fun holder
	(hold
		(ch 2 3 5 7)
		(ch 11 13 33)))

(sync 0.14)

(midi-note-channel
	(seq (latch (st 0.14) holder) (st 0.28))
	(reset 
		(walk 60 (seq 4 b))
		(st 60)
		holder)
	(st 0.1)
	(seq a a)
	(st 3))