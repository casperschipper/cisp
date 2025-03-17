(# steps (5. 5 7 7 12 12 4 4 6 6 6 6 ))

(fun indexer
	(line (seq 0 11) (ch 7 11 14)))

(midi-note-channel-multi
	(reset 
		(walk 100 
		(* (ch 1 1) (index steps indexer))) (walk 50 (ch -2 2)) (st 6))
	(hold (ch 0.1 0.7 1.6 3.2 6) (ch 1 2 3 10 20 30))
	(ch 128 30 40 0 10 20 30)
	(hold (seq 1 2 3 4) (ch 4 8 1 1 1 1 1 8 16))
	(seq 4 (latch (st 0) (ch (ch 1 2 3) 11 22 5)))
	(st 2)
	)

(midi-note-channel-multi
	(reset (walk 36 (ch -1 1)) (st 36) (rv 1 6))
	(st 0.5)
	(st 100)
	(st 5)
	(st 1)
	(st 2)
	)
