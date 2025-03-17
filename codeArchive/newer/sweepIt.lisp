(# steps (5. 5 7 7 12 12 4 4 6 6 6 6 ))

(fun indexer
	(line (seq 0 11) (ch .1 .2 .4)))

(fun a
	(hold (ch 30 50 60 80 100)
		(ch 33 17 5 22)))

(midi-note-channel-multi 
	(bounded-walk (+ indexer 0) a (index steps indexer))

	(hold (ch 0.01 0.02 0.03) (ch 1 2 3 10 20 30))
	
	(seq a a a a)
	
	(st 2)
	
	(ch 1)
	(st 2)
	)
	
