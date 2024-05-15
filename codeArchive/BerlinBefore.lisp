(# penta (0. 3 5 7 10 12))

(# tab1 (alloc 128))


(fun a
	(line
		(seq 0 128)
		(ch .1 .3 .4 1. 2.)))

(fun freq
	(* 440 (mtor (list-walk penta (hold (seq 0 1 -2) (seq 1 2 3 2 1))))))

(fun casper
	(hold 
		(series 1 2 3 2)
		(seq 3 7 11 2 5)))

(~ writeTab
	(write tab1 (bounded-walk -1 1 
		
		(sometimes (ch -0.5 0.5) (hold (seq -0.01 0.01) (rv 0 3)) (line (seq 0 10) (ch 0.5 1 3 7)))

		) (count 128)))

(schedule (~ writeTab) (/ 1 (line (seq 1 1000) (ch 3 7 11))))

(sync 0.1)


(step-gen
	(* (bounded-list-walk a a tab1 (st 1)) 0.1)
	(st 1)
	:pan (rvfi 0 1)
)