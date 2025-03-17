// WITH FUNKY DOWNSTAIRES START SPLIT



(midi-note-channel-multi
	(seq 60)
	(st 0.1)
	(st 64)
	(st 1)
	(hold (seq 1 1 1 0 1 1 0 1 0 1 1 0) (seq (latch (st 1) (st 24)) (latch (st 2) (st 1))))
	(st 2))



(midi-note-channel-multi
	(seq (hold (seq 72 70 68) (rv 5 6)) 74)
	(st 0.1)
	(st 64)
	(st 2)
	(seq 0 1 1 1 0 1 1 0 1 0 1 1)
	(st 2))

(midi-note-channel-multi
	(hold (seq 60 62 48) (seq 3 4 1 3 4 3 4))
	(seq 0.1 0.3)
	(st 64)
	(st 3)
	(seq 0 1 0 (ch 0 0 0 0 0 0 1))
	(st 1))

(fun level
	(line 
		(seq 30 110)
		(ch 3 5 7)))

// epiano chords funky
(midi-note-channel-multi
	(reset (walk 84 (seq -7 -7 -5)) (st 84) (rv 5 8))
	(seq 1.5)
	level
	(st 4)
	(flip OSC.table8 0 (seq 1 0 0 0 0))
	(st 1))

// alt
(midi-note-channel-multi
	(reset (walk 84 (ch -7 -7 -5)) (st 84) (rv 5 8))
	(t (seq 1.5 0.1) (ch 0.5 2 2.5))
	level
	(st 4)
	(flop OSC.table8 0 (seq 1 (ch 0 0 0 1) (ch 0 0 1) 0 0))
	(st 1))












