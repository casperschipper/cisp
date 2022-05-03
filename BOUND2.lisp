

(midi-note-channel
	;i (list-walk (list 0 1 2 3) (hold (seq -1 1) (hold (seq 2 3 2 1 3 2) (seq 3 4 1 3 4 5))))
	(index (list 0.13 0.11) (~ i))
	(index (list (seq (seq 60 48) 62 59) (seq 64 69 62 50) (seq 67 67 64 74) (seq 72 74 71)) (~ i))
	(index (list (seq 0.1 0.01 0.2) 0.02 0.05 0.02) (~ i))
	(st 100)
	(st 1)
	)

