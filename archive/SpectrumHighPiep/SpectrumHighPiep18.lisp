(midi-note-channel-multi
	(clip (+ 
			(seq 0 7 true) 
			(reset 
			(walk 48 (ch -4 4 -2 2)) 
				(st 48) 
				(st 5))) 20 120)
	(st 4)
	(st 100)
	(st 6)
	(st 1)
	(st 1))

(midi-note-channel-multi
	(clip (+ 
		(seq 0 (ch 5 7) true) 
		(reset 
			(walk 36 (ch -4 4 -2 2)) 
			(st 2) 
			(st 5))) 0 100)
	(st 0.5)
	(st 100)
	(st 7)
	(seq 1 0 0 (ch 1 0 0 0 ))
	(st 1))