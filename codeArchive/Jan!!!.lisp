(# durationList
	(.5 1. 3 5))

(fun a
	(line
		(seq 0 (table-cap durationList))
		(ch 13 15)))

(fun b
	(line
		(seq 0 30)
		(ch 13 17)))

(fun indexer
	(rv a a))

(fun c
	(line 
		(seq 0.1 0.5)
		(ch 3 5 7)))

(fun d
	(line 
		(seq 0.2 2.0)
		(ch 3 5 7)))

(osc-stream 
	historyPatch
	(/ 1.0 (line (seq 0.5 1000 1000 1000 1000) (ch 7 11)))
	:offset (line (rv b b) (st 10000))
	:duration (line (seq 20 25) (ch 3 7 11))
	:ratio 
		(seq
			(
				(tlatch (line (+ (ch 0.5 1.0 2.0) (rv 0.97 1.03)) (ch 3 4)) (rv 3 7))
				(tlatch (st 1) (rv 4 11))
				)
			
			)

	:channel (seq 1 2 3 4 5 6 7 8)
	:filter (reset (bounded-mup-walk 20 16000 (ch 1.234 0.97 2.01 0.99 1.49)) (st 440) (rv 5 25))
	:loop (t (ch 1 (rv 12 40) 100 1000 2000) (rv 2 5))
	:drift (st 0)
)