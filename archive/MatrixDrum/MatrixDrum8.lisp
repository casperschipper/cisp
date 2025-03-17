(fun am
	(hold 
		(seq 100 80 40 120)
		(ch 3 4)))

(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(seq am am am am)
	(st 1)
	(hold (seq 1 1 0 1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0))
	(st 2))

(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(seq 100 70 (ch 40 100) (ch 30 100))
	(st 2)
	(hold (seq 0 0 1 0) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0))
	(st 2))


(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(seq 100 (seq 80 30 120) (ch 30 100))
	(st 3)
	(loop (ch 0 1) (st 3) (st 3))
	(st 2))

(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(st 100)
	(st 4)
	(list-walk (0. 1 0 1 0 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 1 0 0 0 1) (hold (ch -1 1) (rv 10 20)))
	(st 1))

(fun a 
	(t 
		(seq 0 1)
		(ch 3 4 5)))

(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(st 100)
	(st 5)
	(seq a a a a)
	(st 2))