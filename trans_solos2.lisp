(sync 0.2)

(fun holder
	(seq 
		(latch (st 1) (st 11))
		(latch (st 2) (seq 1 3 5))))

(fun h (x)
	(hold x (ch 1)))

(midi-note-channel
(st 0.2)
(seq 
	(h (reset (walk 110 (hold (seq -5 -7) holder)) (reset (walk 110 (ch -5 7 0 0 0 2 -2)) (st 80) (st 15)) (st 6)))
	(h (reset (walk 110 (hold (seq -5 -7) holder)) (reset (walk 110 (ch -5 7 0 0 0 2 -2)) (st 90) (st 15)) (st 6)))
	(h (reset (walk 110 (hold (seq -5 -7) holder)) (reset (walk 110 (ch -5 7 0 0 0 2 -2)) (st 100) (st 15)) (st 6))))
(seq 0.4 0.2)
(st 100)
(st 1)
)