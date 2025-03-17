(fun a
	(index 
		(list (seq 55 55 53) (seq 57 57 53))
		(seq 
			(latch (st 0) (st 6))
			(latch (st 1) (st 6)))))

(fun b
	(seq 
		(latch (st 67) (st 3))
		(latch (st 69) (st 3))))


(midi-note-channel
	(seq 0.15 0.1)
	(index (list a 62 b) (reset (walk 0 (st 1)) (st 0) (seq 3 3 2)))
	(seq 0.2 0.2 0.1)
	(rv 80 120)
	(st 1.0))