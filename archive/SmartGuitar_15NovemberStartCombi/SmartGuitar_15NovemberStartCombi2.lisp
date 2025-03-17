// WITH FUNKY DOWNSTAIRES START SPLIT

(fun level
	(line 
		(seq 30 110)
		(ch 3 5 7)))

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



// epiano chords funky
(midi-note-channel-multi
	(reset (walk 84 (seq -7 -7 -5)) (ch 84 82) (rv 5 8))
	(seq 1.2 1.0)
	level
	(st 4)
	(flip OSC.table8 0 (seq 1 0 0 0 0))
	(st 1))

// alt
(midi-note-channel-multi
	(reset (walk 84 (ch -5 -7 12)) (st 84) (rv 5 8))
	(t (seq 0.1 0.2) (ch 0.5 2 2.5))
	level
	(st 4)
	(flop OSC.table8 0 (ch 1 0))
	(st 1))

// THIS IS 5-8 of Smartguitar


(fun level
	(line 
		(seq 30 110)
		(ch 3 5 7)))


(midi-note-channel-multi
	(reset (walk 80 (ch -5 -7)) (ch 84) (rv 1 6))
	(seq 1.5)
	(ch 100 90)
	(st 5)
	(ch 5 1 1 1)
	(st 1))



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
	(flip OSC.table8 1 (seq 1 1 1 1))
	(st 1))

(midi-note-channel-multi
	(seq 60 60 58 58 56 56)
	(seq 0.1)
	(seq 
		(loop (ch 20 70 100) (st 4) (st 4)) 
		(st 80) 
		(loop (ch 20 70 100) (st 4) (st 4)) 
		(ch 100 80 20))
	(st 8)
	(flop OSC.table8 1 (seq 1 1 1 1))
	(st 1))

(midi-note-channel-multi
	(st 60)
	(st 0.1)
	(seq 100 (ch 60 100))
	(st 14)
	(seq 1 (ch 0 1 0))
	(st 1))













