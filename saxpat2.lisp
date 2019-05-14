(sync 0.14)

(fun a 
	(line
		(seq 40 100)
		(ch 7 11)))

(fun b
	(hold
		(seq 1 3)
		(ch 13 33)))

(midi-note
	(* 0.14 (seq 1.05 0.95))
	(+ (list 
		(hold (seq 0 12 24) b) 
		(hold (seq 60 62 64) b) 
		(hold (seq 0 7) b)))
	(st 0.2)
	(seq a a a))
