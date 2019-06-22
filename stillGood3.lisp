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
		(seq 0.01 0.1)
		(ch 3 7 11)))

(~ durRatio
	(line
		(ch 20 60)
		(st 60)))

(fun topFilter
	(line
		(seq 1000 20000)
		(rv 20 45)))

(fun ratioLine
	(line
		(seq 0.1 2.0)
		(ch .1 3 5)))

(osc-stream 
	historyPatch
	(~ duraline)
	:offset (line (seq 0 30) (st 30))//(line (+ (~ bFun) (rv 0 (~ range))) (st 10000))
	:duration (* (~ duraline) (~ durRatio))
	:ratio 
		(index
			(
				(ch 2.0 3.0 4.0 5.0 6.0 7.0) 
				(ch 0.5 1.5 0.66667)
				(ch ratioLine ratioLine)
			) 
			(t
				(rv 0 3)
				(ch 5 11)))
	:channel (list-walk (list 1 2 3 4 5 6 7 8) (hold (ch -1 1) (rv 1 16)))
	:filter 
		(ch
			(tlatch 
				(reset (bounded-mup-walk (st 20) topFilter (index
			(
				(ch 2.0 3.0 4.0 5.0 6.0 7.0) 
				(ch 0.5 1.5 0.66667)
				(ch ratioLine ratioLine)
			) 
			(t
				(rv 0 3)
				(ch 5 11)))) (st 440) (rv 5 25))
				(st 33))
			(tlatch
				(st 0)
				(st 17)))
	:loop (t (ch 1 3 4) (rv 2 5))
	:drift (st 0)
)