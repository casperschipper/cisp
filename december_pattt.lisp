(fun a 
	(hold (ch 60 62 64 65 67 48 46) (ch 3 5 7 11)))

(fun b 
	(hold 
	(seq 0.1 0.01 0.2 0.4) 
	(ch 1 2 4 8 16 32)))

(fun c
	(hold
	(ch 22 33 44 55 55 55 55 88)
	(ch 1 1 1 13 7)))

(midi-note-channel
		(st 0.2)
		(seq a a)
		b
		(seq c (latch (seq 30 40 30 20 50 10 20) (seq 7)))
		(st 1))

(midi-note-channel
		(st 0.3)
		(seq a a a)
		b
		(seq c (latch (seq 30 40 15 20 50) (seq 5)))
		(st 2))

(midi-note-channel
		(st 0.1)
		(hold (seq 72 a) (st 1))
		b
		(seq c (latch (seq 10 20 10 5 30 40 20 10 20) (seq 11)))
		(st 3))
