(fun rhythm
	(t (seq 0.1 0.14 0.28) (ch .1 .2 .3 4)))

(fun seventy
	(t
		(seq 0.75 1.5 2 4 10)
		(st 3)))


(clone 
(step-gen
	(* (seq -1 1) 0.5)
	(* (/ 44100 
		(t
			(loop (bounded-mup-walk 1000 10000 (ch 1 seventy 1.5)) (st 4) (ch 2 4))
			(line (seq 0.01 10.0) (st 10))))10 ) 4) 