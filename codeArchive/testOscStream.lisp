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
	(/ 1.0 (line (seq 0.5 60) (ch 7 11)))
	:offset (line (seq 0 30) (ch 34 100 128))
	:duration (line (seq 0.1 2.0 5.0) (ch 3 7 11))
	:ratio 
		(index
			(
				(t (ch 0.5 1.5 1.66666 0.75 0.25 0.125) (ch 3 4))
				(st 1)
				)
			(t (count 2) (rv 3 6)))

	:channel (seq 1 2 3 4 5 6 7 8)
	:filter (reset (bounded-mup-walk 20 16000 (ch 0.5 2.0 1.5 0.6666666666667)) (st 440) (rv 5 25))
	:loop (line (ch 100 10 1) (rv 2 5))
	:drift (st 0)
)