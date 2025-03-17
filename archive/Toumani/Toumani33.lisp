(fun liner
	(line
	(seq 0.01 1.0)
	(ch 0.1 0.5 1. 3. 4)))

(midi-note-channel
	(st 0.14)
	(+ (~ pitch) 12)
	(seq (ch 0.01 liner) 0.2)
	(+ (seq 80 40 60 (seq 80 (ch 50 127))) (seq 0 40))
	(st 1))

(fun a 
	(hold 
	(ch 12 4 5 7)
	(ch 3 5 6 12)))

(~ pitch (seq
	(seq 60 60 (reset 
		(walk 74 (ch -12 -7 7 12))
		(st 60) (st 6)))
	(seq 67 67 67)
	(seq 72 72 (reset 
		(walk 74 (ch -12 -7 7 12))
		(st 60) (st 6)))))
