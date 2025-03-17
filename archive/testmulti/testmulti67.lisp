(# steps (1.0 7 5 4 3 2 1 9 11 6))

(fun indexer
	(line (seq 0 11) (ch .3 .4 .5 7)))

(midi-note-channel-multi
	(reset 
		(walk 100 
		(* (ch -1 1) (index steps indexer))) (st 100) (st 30))
	(hold (ch 3.0 4.0) (ch 1 2 3 10 20 30))
	(st 80)
	(seq 1)
	(seq 30 (latch (st 0) (rv 4 10)) )
	(st 2)
	)

(midi-note-channel-multi
	(reset 
		(walk 100 
		(* (ch -1 1) (index steps indexer))) (st 100) (st 30))
	(hold (ch 0.1 ) (ch 1 2 3 10 20 30))
	(st 80)
	(seq 1)
	(seq 1)
	(st 2)
	)