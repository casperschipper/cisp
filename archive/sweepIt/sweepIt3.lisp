(# steps (5. 5 7 7 12 12 4 4 6 6 6 6 ))

(fun indexer
	(line (seq 0 11) (ch .1 .2 .4)))

(midi-note-channel-multi 
		(bounded-walk 20 100 (index steps indexer))

		(hold (ch 0.1 0.7 1.6 3.2 6) (ch 1 2 3 10 20 30))
		(ch 100)
	(st 2)
	(seq 
		1
		(latch (st 0) (ch (ch 1 2 3) 11 22 5)))
	(st 2))
	
