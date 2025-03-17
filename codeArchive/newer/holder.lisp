(fun a
	(line 
		(ch 0.001 0.002 0.02 0.001 0.25)
		(ch 3 5 6)))

(fun b
	(line (rv 0 127) (ch 0.1 7.0 2.0 3.0)))

(fun size
	(t (seq 1 5 2 12) (ch 4.0 7.0))
	)


(midi-note-channel
	(seq a a a)
	(q (rv b b) size)
	(st 0.1)
	(seq b b b)
	(st 1.0))