(# t1 (fillf 44100 0 0))

(samp-schedule
	(write t1 (audioIn (st 0)) (count (table-cap t1)))
	(st 1))

(fun speed
	(t 
		(ch 1 2 3 4 5 0.5 0.25)
		(ch 1.0 0.5 )
	))

(step-gen
	(* 5 (index t1 (bounded-walk (st 0) (table-cap t1) speed)))
	(st 1)
)