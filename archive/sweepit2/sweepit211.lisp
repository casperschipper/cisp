(# steps (5. 12 24 6 3 4 9  ))

(fun indexer
	(line (seq 0 11) (ch .1 .2 .4)))

(fun a
	(hold (ch 30 50 60 80 100)
		(ch 33 17 5 22)))

(midi-note-channel-multi 
	(bounded-walk (+ indexer 0) (st 128) (index steps indexer))

	(hold (ch 10) (ch 1 2 3 10 20 30))
	
	(seq a a a a)
	
	(st 2)
	
	(seq (latch (st 1) (st 20)) (latch (st 0) (st 500)))
	(st 2)
	)
	
