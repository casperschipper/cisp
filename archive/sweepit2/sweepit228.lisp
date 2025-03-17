(# steps (1. 2 3 4 5 6 7 8 9 10 11 12))

(fun indexer
	(line (seq 0 13) (ch .1 .2 .4)))

(fun a
	(hold (ch 30 50 60 80 100)
		(ch 33 17 5 22)))

(midi-note-channel-multi 
	(bounded-walk (st 20) (st 128) (index steps indexer))

	(hold (ch 2 3) (ch 1 2 3 10 20 30 50 100))
	
	(seq a a a a)
	
	(st 4)
	
	(seq (latch (st 1) (ch 3 5 20)) (latch (st 0) (st 500)))
	(st 2)
	)
	
