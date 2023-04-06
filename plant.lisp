(# pitch
	(collect (reset (walk 60 (ch -7 -7 -12 12 -12)) 
		(reset (walk 60 (ch -7 -7 -12 12 -12)) (st 60) (st 8)) (st 6)) 64))

(~ index
	(line 
		(seq 0 1)
		(seq 3 7)))

(# amp
	(list 10. 20 30 40 50 60 70 80 100))

(# durations
	(list 0.5 1.0 2.0 2.5 1.5 3.0 4.0))


(midi-note-channel
	(+ (* (~ index) 1.0) 0.01)
	(index pitch (* (~ index) (table-cap pitch)))
	(index durations (* (~ index) (table-cap durations)))
	(index amp (* (~ index) (table-cap amp)))
	(hold (ch 1 2 3) (ch 4 8 1 11 13))) 