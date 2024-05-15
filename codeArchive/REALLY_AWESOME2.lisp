(~ tempo (st 0.07))

(fun value
	(seq
		(seq (list 1. 0 0 0) true)
		(latch (st 0) (seq 4))))

(fun snarePat
	(seq 1 0 (ch 0.5 1 0.1) 0.05 1 (latch (st 0) (seq 5 7))))

(fun hatpat
	(seq 
		(seq (list 1.0 0.5 1) true)
		(latch (st 0.1) (sometimes 4 5 10))))

(# rhythm (collect value 60))
(# rhythm2 (collect snarePat 60))
(# rhythm3 (collect hatpat 12))


(test value)

(~ writer
	(write rhythm value (count 60)))

(~ writer2
	(write rhythm2 snarePat (count 60)))

(~ writer3
	(write rhythm3 hatpat (count 12)))

(schedule
	(seq (~ writer) (~ writer2) (~ writer3))
	(* (~ tempo) 2))


(midi-note
	(~ tempo)
	(st 36) 
	(~ tempo)
	(* (st 128) (seq rhythm))
	)

(midi-note
	(~ tempo)
	(st 38) 
	(~ tempo)
	(* (st 80) (seq rhythm2))
	)

(midi-note
	(st 0.14)
	(st 42) 
	(~ tempo)
	(* (st 80) (seq rhythm3))
	)
