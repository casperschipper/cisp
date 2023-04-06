(# myScale2 (fillf 24 60 82))

(fun seven
	(hold
		(seq 7 4)
		(ch 3 7)))

(~ casper
	(write myScale2 
	(bounded-walk 50 86 (ch (* -1 seven) seven))
	(count 24)))

(schedule
	(~ casper) 
	(st 1.0))

(fun tone
	(index
		myScale2
		(line (seq 0 (table-cap myScale2)) (loop (ch .5 1 3 7) (ch 3 4) (ch 3 4) ))))

(procedure tester
	(print myScale2))

(sync 0.14)


(clone
(midi-note
(st 0.14)
(floor tone)
(st 1.0)
(hold (seq 64 46 80) (ch 2 3))
)
1)