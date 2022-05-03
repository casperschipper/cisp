(fun seven
	(hold
		(seq 7 0 12 14 0 7) 
		(seq 11 7 11 3 2 4 11)))

(midi-note-channel
	;i (list-walk (list 0 1 2 3) (hold (seq -1 1) (hold (seq 2 3 2 1 3 2) (seq 3 4 1 3 4 5))))
	(index (list 0.13 0.11) (~ i))
	(index
		(list
			(index (list (seq (seq 60 48) 62 59) (seq 64 69 62 50) (seq 67 67 64 74) (seq 72 (seq 74 72 74 84 74 74 91) 71)) (~ i))
			(reset (walk 60 (hold (seq (* -1 seven) seven) (seq 2 1 2 3 2 1))) (seq 60 55 60 48 72) (seq 7 11))
			)
	    (seq 
	    	(latch (st 0) (seq 7 11))  
	    	(latch (st 1) (seq 3 7 11))))

	(index (list (seq 0.1 0.01 0.6) 0.02 0.05 0.02) (~ i))
	(seq 100 60 80)
	(st 1)
	)

