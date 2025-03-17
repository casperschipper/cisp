(fun a
	(seq 72 70 68))

(fun b
	(seq 67 66 67 68 65))

(fun c
	(seq 60 55 50 45))

(fun d
	(seq 58 58 58 60 65 72 58))


(midi-note-channel
	(st 0.14)
	(seq a b c d)
	(st 0.2)
	(st 100)
	(st 1))