(# steps (5. 5 7 7 12 12 4 4 6 6 6 6 ))

(fun indexer
	(line (seq 0 11) (ch .1 .2 .4)))

(midi-note-channel-multi 
		(bounded-walk (+ indexer 30) (st 60) (index steps indexer))

		(hold (ch 0.2) (ch 1 2 3 10 20 30))
		(index (30. 64 100) (line (seq 0 2) (ch 0.1 4 8)))
	(st 2)
	(ch 1)
	(st 2))
	
