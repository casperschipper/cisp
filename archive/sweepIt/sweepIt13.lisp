(# steps (5. 5 7 7 12 12 4 4 6 6 6 6 ))

(fun indexer
	(line (seq 0 11) (ch .1 .2 .4)))

(midi-note-channel-multi 
		(bounded-walk (+ indexer 30) (st 100) (index steps indexer))

		(hold (ch 0.01) (ch 1 2 3 10 20 30))
		(ch 100)
	(st 2)
	(ch 1 0 0 0)
	(st 2))
	
