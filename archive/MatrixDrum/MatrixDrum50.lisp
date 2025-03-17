(fun am
	(hold 
		(seq 100 (hold (ch 40 50 100 10) (ch 2 3)) 40 120)
		(ch 3 4)))

(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(seq am am am am)
	(st 1)
	(hold (seq 1 1 1 1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0))
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


(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(seq 120)
	(st 4)
	(st 1)
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

(midi-note-channel-multi
	(st 60)
	(seq 0.1)
	(ch 90 100 128)
	(hold (seq 6 7) (ch 3 4 3 3 2))
	(seq (latch (st 0) (seq 1 3 (ch 1 2 3))) (st 1))
	(st 2))

(fun control
	(line (seq 0 1 1 0 0 0 0 0 0 0 0 0 0 ) (ch .3 .6)))

(fun indexer
	(* control (* 12 
		(rv 
			(line
				(seq 0 1) (ch 3 5 7))
			(line (seq 1 0) (ch 3 4 5))

			))))

(midi-note-channel-multi
	(+ 60 (index (list 0. 2 4 5 7 9 11 12 14 16 17 19) indexer))
	(seq 0.1)
	(ch 50 60 55 65 100)
	(st 8)
	(list-walk (0. 1 0 1 0 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 1 0 0 0 1) (hold (ch -1 1) (rv 10 20)))
	(st 1))