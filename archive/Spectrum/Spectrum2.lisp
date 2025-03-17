(fun walker
	(ch -12 12))

(midi-note-channel-multi
	(walk 60 walker)
	(st 4)
	(st 100)
	(st 1)
	(ch 0 0 0 0 0 0 0 1)
	(st 2))

(midi-note-channel-multi
	(walk 60 (ch -5 5))
	(st 4)
	(st 100)
	(st 2)
	(ch 0 0 0 0 0 0 0 1)
	(st 2))

(fun walker2 
	(* (ch -1 1) (t (ch 1 3 5 7 12) (ch 3 5 7))))

(midi-note-channel-multi
	(walk 60 walker2)
	(st 4)
	(st 100)
	(st 3)
	(ch 1)
	(st 2))