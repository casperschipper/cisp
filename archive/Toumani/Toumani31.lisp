(fun liner
	(line
	(seq 0.01 1.0)
	(ch 0.1 0.5 1. 3. 4)))

(midi-note-channel
	(st 0.14)
	(+ (~ pitch) 12)
	(seq (ch 0.01 liner) 0.2)
	(+ (seq 80 40 60 (seq 80 (ch 50 127))) (seq -40 40))
	(st 1))

