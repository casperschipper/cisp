

(midi-note-channel-trigger
	(reset (walk 60 (ch 4 7)) (st 84) (rv 2 4))
	(seq 1.5)
	(st 64)
	(st 9)
	(seq 1 1))


(fun a
	(line (seq 30 128) (ch .1 .2 .4)))

(midi-note-channel-trigger
	(+ (st 36) (seq 0 4 8))
	(ch 0.4 1.4)
	(seq 100 a a 100 a a)
	(st 10)
	(seq 1 (seq 0 1 0 0) (seq 0 0 1)))

// langzaam

(# scale1 (0. 2 5 7 12))

(midi-note-channel-trigger
	(reset 
		(walk 50 (index scale1 (line (seq 0 5) (rv 5 11))))
		(st 50)
		(rv 3 7))
	(st 3.0)
	(seq 100)
	(st 12)
	(seq 1 0 0 0 0 0))

(midi-note-channel-trigger
	(reset 
		(walk 57 (index scale1 (line (seq 0 5) (rv 5 11))))
		(st 57)
		(rv 3 7))
	(st 3.0)
	(line (seq 30 100) (rv 5 10))
	(st 13)
	(seq 0 0 0 0 1 0))

(fun walker 
	(reset (walk 60 (ch -4 4)) (st 60) (rv 5 7)))

(midi-note-channel-trigger
	(seq walker walker walker)
	(st 3.0)
	(line (seq 30 100) (rv 5 10))
	(st 14)
	(seq 0 0 0 0 1 0))

(midi-ctrl 
	(st 0.05)
	(st 12)
	(st 1)
	(line (seq 0 100) (st 2.0))
	)

// beginnen met kort en dan langer

(midi-note-channel
	(line (seq 0.01 0.9) (ch .3 .5 .6))
	(q (rv 40 79) (t (ch 0 7 12 4) (ch 3 7 11)))
	(seq 0.01 0.02) 
	(rv 40 100)
	(st 15)
	)

(midi-note-channel
	(line (seq 0.1 0.2) (ch .3 .5 .6))
	(reset (walk 60 (ch -12 12)) (st 60) (rv 3 4))
	(st 0.1)
	(rv 40 100)
	(st 16)
	)

