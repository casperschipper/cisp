(fun level
	(line 
		(seq 30 110)
		(ch 3 5 7)))


(midi-note-channel-multi
	(reset (walk 80 (ch -5 5)) (ch 70 65 60) (rv 1 2))
	(seq 1.5)
	(ch 40 80)
	(st 5)
	(ch 1 1 1 1)
	(st 2))



(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(seq 100 80 40 80)
	(st 7)
	(seq 1 1 (ch 0 0 1) 1)
	(st 1))

(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(seq 
		(loop (ch 20 70 100) (st 4) (st 4)) 
		(st 80) 
		(loop (ch 20 70 100) (st 4) (st 4)) 
		(ch 100 80 20))
	(st 8)
	(seq 1 1 1 1)
	(st 1))