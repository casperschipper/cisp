(# steps (5. 5 7 7 12 12 4 4 5 5 5 5 5))

(fun indexer
	(line (seq 0 11) (ch .3 .4 .5 7)))

(midi-note-channel-multi
	(reset 
		(walk 100 
		(* (ch 1 1) (index steps indexer))) (walk 50 (ch -5 5)) (st 6))
	(hold (ch 0.1 0.7) (ch 1 2 3 10 20 30))
	(st 80)
	(seq 1)
	(seq 4 (latch (st 0) (seq 1 1 (ch 2 3 5)) )
	(st 2)
	)
