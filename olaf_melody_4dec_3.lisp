(fun nudge
	(+ 
		(* -10 (single-key 1 "0"))
		(* 10 (single-key 1 "1"))))

(sync 0.5)

(midi-note
	(beat (+ 120 nudge) 4)
	(loop 
		(+ 28 (reset (walk 0 (seq -3 -4 (ch 7 12))) (st 28) (seq 7 11)))
		(index (list 3 8) (single-key 1 "h"))
		(index (list (sometimes 2 7 10) 3) (single-key 1 "t")))
	(st 0.25)
	(st 80))


/* (trigger-reset (walk 48 (seq 3 4))  (st 60) (single-key 1 "r")) */