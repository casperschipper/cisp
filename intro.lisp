(fun amp
	(bounded-walk (st -1) (st 1) (ch -0.01 0.01)))

(fun time
	(bounded-walk (st 1) (st 10) (ch -0.01 0.01)))

(line-gen
	(* (seq amp (rv -1 1) amp amp amp) 4)
	(seq time time (rv 1 10) time))
	