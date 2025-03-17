(# steps (1.0 7 5 4 3 2 1 9 11 6))

(fun indexer
	(line (seq 0 11) (ch 3 4 5 7)))

(midi-note-channel-multi
	(reset 
		(walk 100 
		(* (ch -1 1) (index steps indexer))) (st 100) (st 30))
	(hold (ch 3.0 4.0) (ch 1 2 3 10 20 30))
	(st 80)
	(seq 1 0 0 0)
	(seq 40)
	(st 2)
	)