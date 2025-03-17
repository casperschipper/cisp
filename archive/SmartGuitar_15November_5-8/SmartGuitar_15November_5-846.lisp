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
	(st 100)
	(st 14)
	(seq 1 0)
	(st 1))


