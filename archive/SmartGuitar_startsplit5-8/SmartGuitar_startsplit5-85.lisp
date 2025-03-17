(fun level
	(line 
		(seq 30 110)
		(ch 3 5 7)))

(midi-note-channel-trigger
	(reset (walk 84 (seq -7 -7 -5)) (st 84) (rv 5 8))
	(seq 1.5)
	level
	(st 5)
	(seq 0 0 1 0 (ch 0 1)))


(midi-note-channel-trigger
	(reset (walk 84 (ch -7 -7 -5)) (st 84) (rv 5 8))
	(seq 1.5)
	level
	(st 6)
	(seq 0 1 0 1 0))

(midi-note-channel-trigger
	(st 60)
	(seq 0.1)
	(seq 100 80 40 80)
	(st 7)
	(seq 1 1 (ch 0 0 1) 1))

(midi-note-channel-trigger
	(st 60)
	(seq 0.1)
	(seq 
		(loop (ch 20 70 100) (st 4) (st 4)) 
		(st 80) 
		(loop (ch 20 70 100) (st 4) (st 4)) 
		(ch 100 80 20))
	(st 8)
	(seq 1 1 1 1))