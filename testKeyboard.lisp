(fun nudge
	(+ 
		(* -10 (single-key 1 "0"))
		(* 10 (single-key 1 "1"))))

(sync 0.5)

(midi-note
	(beat (+ 120 nudge) 4)
	(loop 
		(+ 38 (reset (walk 0 (seq -3 -4 (ch 7 12))) (st 40) (seq 7 11)))
		(st 3)
		(st 2))
	(st 0.1)
	(st 80))


/* (trigger-reset (walk 48 (seq 3 4))  (st 60) (single-key 1 "r")) */