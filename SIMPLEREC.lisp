(# tab1 (fillf 44100 0 0))

(samp-schedule 
	(write tab1 (audioIn (st 0)) (count (table-cap tab1)))
	(st 1)
	)

(fun harm
	(t
		(seq 1 2 3 4 5)
		(ch 0.1 0.03 0.5)))

(fun speed 
	(t 
		(/ harm harm)
		(t (ch 0.01 0.02 0.03 0.4 1.0) (ch 0.01 0.2 0.3 0.4 1.0))))


(clone
(step-gen
	(* (index-lin tab1 (bounded-walk (st 0) (table-cap tab1) speed)) 5.0)
	(st 1)
	:pan (rvfi -1 1))
	5
	)