(# durationList
	(.5 1. 3 5))

(fun a
	(line
		(seq 0 (table-cap durationList))
		(ch 13 15)))

(fun b
	(line
		(rv 0 30)
		(ch 13 17)))

(~ Bfun
	b)

(~ range
	(line
		(ch 0.0 0.01 0.1 0.2)
		(ch 1 3 7 13)))

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

(fun controlRatio
		(index
			(
				(rv 1 6)
				(rv 0.001 0.01)
				(ch 1 5 7))
			(t
				(rv 0 3)
				(rv 3 8))))


(~ duraline
	(line
		(seq 0.1 4 5)
		(ch 3 7 11)))

(~ durRatio
	(line
		(seq 1 10)
		(st 60)))

(osc-stream 
	historyPatch
	(~ duraline)
	:offset (line (seq 0 30) (st 30))//(line (+ (~ bFun) (rv 0 (~ range))) (st 10000))
	:duration (* (~ duraline) (~ durRatio))
	:ratio 
		(t (ch 0.5 1.67 2.0 0.666667) controlRatio)

	:channel (list-walk (list 1 2 3 4 5 6 7 8) (hold (ch -1 1) (rv 1 16)))
	:filter (reset (bounded-mup-walk 20 16000 (ch 0.66666667 1.5 2.0 0.5)) (st 440) (rv 5 25))
	:loop (t (* (~ durRatio) (~ durRatio)) (rv 2 5))
	:drift (st 0)
)