(midi-note-channel-sync
	(seq 
		(+ (seq 48 72 84 true) (latch (list-walk (0 4 5 12 -14 -19) (hold (seq -1 1) (seq 3 4 5))) (ch 3 4)))
		(+ (seq 48 72 84 true) (latch (list-walk (0 4 5 12 -14 -18) (hold (seq -1 1) (seq 3 4 5))) (ch 3 4)))
		)
	(st 0.1)
	(seq 100)
	(st 1)
	)