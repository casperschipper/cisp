(fun walksize
	(hold 
	(ch 3 2 2 2 2 2 5)
	(ch 3 5 11)
	))

(~ a
	(hold
		(seq 5 7 12)
		(ch 13 15 17)))

(midi-note-channel
	(st 1.0)
	(reset 
		(walk 0 
			(* (~ a) (hold (seq -1 1) walksize))) 
			(st 52) 
			(st 5))
	(seq 3.0 5.0)
	(st 100)
	(st 1)
	)

(midi-note-channel
	(st 0.125)
	(reset 
		(walk 0 
			(* (~ a) (hold (seq -1 1) walksize))) 
			(st 52) 
			(st 5))
	(seq 0.2 0.3)
	(st 100)
	(st 1)
	)

(midi-note-channel
	(st 1.5)
	(reset 
		(walk 0 
			(* (~ a) (hold (seq -1 1) walksize))) 
			(st 52) 
			(st 5))
	(seq 3.0 5.0)
	(st 100)
	(st 1)
	)