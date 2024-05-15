(sync 0.2)

(fun holder
	(seq 
		(latch (st 1) (rv 1 11))
		(latch (st 2) (ch 1 2))))

(fun h (x)
	(hold x (ch 1 1 1 1 1 1 1 1 1 1 1 2 2)))

(midi-note-channel
(seq 0.2)
(index  
	(list 
	(h (reset (walk 110 (hold (seq -5 -7) holder)) (reset (walk 50 (ch -5 7 0 0 0 2 -2)) (st 50) (st 15)) (st 6)))
	(h (reset (walk 110 (hold (seq -5 -7) holder)) (reset (walk 50 (ch -5 7 0 0 0 2 -2)) (st 50) (st 15)) (st 6)))
	(h (reset (walk 110 (hold (seq -5 -7) holder)) (reset (walk 50 (ch -5 7 0 0 0 2 -2)) (st 50) (st 15)) (st 6)))
	)
	(hold (count 3) (hold (ch 3 5 11) (ch 11 13 29)))
	)
(seq 0.1 0.1 0.1)
(st 100)
(st 1)
)