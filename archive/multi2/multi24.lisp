(# steps (5. 5 7 7 12 12 4 4 5 5 5 5 5))

(fun indexer
	(line (seq 0 11) (ch .3 .4 .5 7)))

(midi-note-channel-multi
	(reset 
		(walk 100 
		(* (ch -1 1) (index steps indexer))) (st 50) (st 30))
	(hold (ch 0.1 0.7) (ch 1 2 3 10 20 30))
	(st 80)
	(seq 1)
	(seq 4 (latch (st 0) (rv 4 10)) )
	(st 2)
	)
