(sync 0.2)

(fun holder
	(seq 
		(latch (st 1) (st 11))
		(latch (st 2) (seq 1 3 5))))

(midi-note-channel
(st 0.2)
(seq 
	(reset (walk 110 (hold (seq -5 -7) holder)) (reset (walk 48 (ch -5 7 0 0 0 2 -2)) (st 60) (st 15)) (st 6))
	(reset (walk 110 (hold (seq -5 -7) holder)) (reset (walk 48 (ch -5 7 0 0 0 2 -2)) (st 48) (st 15)) (st 6))
	(reset (walk 110 (hold (seq -5 -7) holder)) (reset (walk 48 (ch -5 7 0 0 0 2 -2)) (st 72) (st 15)) (st 6)))
(seq 0.4 0.2)
(st 100)
(st 1)
)