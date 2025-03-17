(fun two
	(hold
		(ch 2 5)
		(ch 3 2 4)))

(sync 0.14)

(fun a
	(line 
		(ch 0.1)
		(ch 1.5 3 4.5)))

(midi-note-channel
	(seq 0.14 0.14)
	(seq 
		(latch (st 46) (ch 1 1 1 1 2))
		(latch (st 44) (ch 2 3))
		(latch (st 47) (ch 1 1 1 2)))
	(seq a a)
	(seq 100 80)
	(st 2))