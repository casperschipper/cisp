(fun nudge
	(+ 
		(* -10 (single-key 1 "0"))
		(* 10 (single-key 1 "1"))))

(sync 0.5)

(fun sevenOrTwo
	(seq
		(latch (st 7) (st 1))
		(latch (st 2) (seq 3 5 2))))

(clone
(midi-note
	(beat (+ 120 nudge) 4)
	(loop 
		(+ 28 (reset (walk 0 (seq -12 -7 (ch 7 12))) (st 40) (seq 7 11)))
		(index (list 3 8) (single-key 1 "h"))
		(index (list sevenOrTwo 3) (single-key 1 "t")))
	(line (seq 0.05 3.0) (st 15))
	(line (seq 110 50) (st 15)) 
	) 1)


/* (trigger-reset (walk 48 (seq 3 4))  (st 60) (single-key 1 "r")) */