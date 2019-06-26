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

(fun ratioA
	(line
		(ch 1.5 2.0 1.25 1.333333333 1.4 3.14159265 1.4142)
		(ch 3 5 6)))

(fun ratioCreator
	(seq ratioA (/ 1.0 ratioA)))

(fun oneDur
	(line
		(seq 0.001 2.0)
		(ch 1 3 7)))

(~ indexBuf
	(line
		(seq 0 30)
		(st 60)))

(osc-stream 
	historyPatch
	(seq (steno "0.0 0!10 3.0"))
	:offset (+ (~ indexBuf) (rv 0.0 0.01))
	:duration (rv 0 (line (seq 1 9) (ch 3 4)))
	:ratio  (ch 0.5 0.25 1.0 1.5 2. 4)
	:channel (list-walk (list 1 2 3 4 5 6 7 8) (hold (ch -1 1) (ch (steno "bcdbcdbcbdbccbcdbcbbcdddbcdbceffggfggfgfgcgcdbcbdbccccdbcdbbbbbbbbbbbebebebhhghghge"))))
	:filter (mtof (rv 0 128))
	:drift (rv 0 10)
	:filterQ (rv 1 100)
	:filterGain (st 4)
	:mainGain (st 0.3)
	:loop (rv 1 20)
)