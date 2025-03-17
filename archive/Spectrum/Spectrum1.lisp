(fun walker
	(ch -12 12))

(midi-note-channel-multi
	(walk 60 walker)
	(st 4)
	(st 100)
	(st 1)
	(ch 0 0 0 0 0 0 0 1)
	(st 2))