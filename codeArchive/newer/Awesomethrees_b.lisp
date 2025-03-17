(fun two
	(hold
		(ch 2 5)
		(ch 3 2 4)))

(sync 0.1)

(fun a
	(line 
		(ch 0.01 0.005 0.2 1.2)
		(ch 1.5 3 4.5)))

(midi-note-channel
	(seq 0.14 0.12)
	(+ 
		(
			(hold (seq -12 (seq 0 -7 7) two 12) (seq 2 2 2 1))
			36 
			(hold (seq 0 7 0 7 0 14) (seq 1 1 1 1 1 2))
			(hold (seq 0 0 0 0 0 5 (seq 0 5 10 true) 0 0 0 2) (seq 1 1 1 1 1 1 1 5)))
		)
	(seq a a)
	(seq 100 80 100 90 100 40 100 80)
	(seq 1 2))