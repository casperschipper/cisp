(midi-note-channel-trigger
	(seq 60)
	(st 0.1)
	(st 64)
	(st 1)
	(hold (seq 1 1 1 0 1 1 0 1 0 1 1 0) (seq (latch (st 1) (st 24)) (latch (st 2) (st 1)))))



(midi-note-channel-trigger
	(seq (hold (seq 72 70 68) (rv 5 6)) 74)
	(st 0.1)
	(st 64)
	(st 2)
	(seq 0 1 1 1 0 1 1 0 1 0 1 1))

(midi-note-channel-trigger
	(hold (seq 60 62 48) (seq 3 4 1 3 4 3 4))
	(seq 0.1 0.3)
	(st 64)
	(st 3)
	(seq 0 1 0 (ch 0 0 0 0 0 0 1)))

(fun level
	(line 
		(seq 30 110)
		(ch 3 5 7)))

(midi-note-channel-trigger
	(reset (walk 84 (seq -7 -7 -5)) (st 84) (rv 5 8))
	(seq 1.5)
	level
	(st 4)
	(seq 1 0 0 0 0))

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



(midi-note-channel
(st 0.25)
(st 60)
(st 1.0)
(st 100)
(st 1))







