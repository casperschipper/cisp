(fun topnote
	(index
		(26 36 38 40)
		(line (seq 0 5) (ch 0.9 9))))

(fun middleNote
	(index
		(7 9 5 0 12)
		(line (seq 0 6) (ch 7 7.4))))


(midi-note-channel
	(beat 120 4)
    (+ 48 
		(index 
		 (0 4 middleNote 12 19 24 topnote) (line (seq 8 0) (seq 0.1 0.23234234))))
	(st 0.1)
    (seq (line (seq 100 70) (st 12)) 80)
	(st 1))

(midi-note-channel
	(beat 120 4)
    (+ 48 
		(index 
		 (0 4 middleNote 12 19 24 topnote) (line (seq 8 0) (seq 0.1 0.5))))
	(st 0.1)
    (seq (line (seq 100 70) (st 12)) 80)
	(st 2))

